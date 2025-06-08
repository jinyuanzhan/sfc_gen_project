#include <chrono>
#include <cmath>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>
#include <ros/console.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <std_msgs/ColorRGBA.h>
#include <visualization_msgs/Marker.h>

#include "gcopter/sfc_gen.hpp"
#include "gcopter/visualizer.hpp"
#include "gcopter/voxel_map.hpp"

#include <decomp_ros_utils/data_ros_utils.h>
#include <decomp_util/ellipsoid_decomp.h>

// =============================================================================================
// DecompSFCGenerator
// =============================================================================================

class DecompSFCGenerator {
public:
    DecompSFCGenerator();
    ~DecompSFCGenerator() = default;

    void setParameters(double bbox_size, double safety_margin);
    void setVoxelMap(const voxel_map::VoxelMap* voxel_map, double dilate_radius);

    bool generate(const std::vector<Eigen::Vector3d>& path,
                  std::vector<Eigen::MatrixX4d>&       h_polys);

    void getVisualizationMesh(const std::vector<Eigen::MatrixX4d>& h_polys,
                              visualization_msgs::Marker&          mesh_msg);

private:
    // External resources
    const voxel_map::VoxelMap* voxel_map_{nullptr};

    // Configuration parameters
    double dilate_radius_{0.0};
    double local_bbox_size_{2.0};
    double safety_margin_{0.2};

    // Internal helper
    EllipsoidDecomp3D decomp_util_;

    void convertPolyhedronToMatrix(const Polyhedron3D& poly, Eigen::MatrixX4d& h_poly) const;
    [[nodiscard]] bool isPointInsideCorridor(const Eigen::Vector3d& point,
                                             const Eigen::MatrixX4d& h_poly) const;
};

// -------------------------------------------------------------------------------------------------
// DecompSFCGenerator implementation
// -------------------------------------------------------------------------------------------------

DecompSFCGenerator::DecompSFCGenerator() { ROS_INFO("DecompSFCGenerator initialized"); }

void DecompSFCGenerator::setParameters(const double bbox_size, const double safety_margin) {
    local_bbox_size_ = bbox_size;
    safety_margin_   = safety_margin;

    const Vec3f bbox(local_bbox_size_, local_bbox_size_, local_bbox_size_);
    decomp_util_.set_local_bbox(bbox);
}

void DecompSFCGenerator::setVoxelMap(const voxel_map::VoxelMap* voxel_map,
                                     const double               dilate_radius) {
    voxel_map_     = voxel_map;
    dilate_radius_ = dilate_radius;
}

bool DecompSFCGenerator::generate(const std::vector<Eigen::Vector3d>& path,
                                  std::vector<Eigen::MatrixX4d>&      h_polys) {
    h_polys.clear();
    if (path.size() < 2 || voxel_map_ == nullptr) {
        ROS_WARN("Invalid input for SFC generation");
        return false;
    }

    // Convert path for decomp_util
    vec_Vec3f path_decomp;
    path_decomp.reserve(path.size());
    for (const auto& p : path) path_decomp.emplace_back(p.x(), p.y(), p.z());

    // Extract occupied voxels
    vec_Vec3f obs_decomp;
    const Eigen::Vector3i& voxel_num    = voxel_map_->getSize();
    const Eigen::Vector3d& voxel_origin = voxel_map_->getOrigin();
    const double           scale        = voxel_map_->getScale();

    for (int x = 0; x < voxel_num.x(); ++x) {
        for (int y = 0; y < voxel_num.y(); ++y) {
            for (int z = 0; z < voxel_num.z(); ++z) {
                const Eigen::Vector3i voxel_idx(x, y, z);
                if (voxel_map_->query(voxel_idx) == 1) {
                    const Eigen::Vector3d obs_point =
                        voxel_origin + Eigen::Vector3d(x * scale, y * scale, z * scale);
                    obs_decomp.emplace_back(obs_point.x(), obs_point.y(), obs_point.z());
                }
            }
        }
    }
    ROS_INFO("Obstacle point number: %zu", obs_decomp.size());

    // Run decomposition
    decomp_util_.set_obs(obs_decomp);

    try {
        decomp_util_.dilate(path_decomp);
        const auto& polyhedrons = decomp_util_.get_polyhedrons();
        if (polyhedrons.empty()) {
            ROS_WARN("Failed to generate any corridors");
            return false;
        }

        h_polys.resize(polyhedrons.size());
        for (size_t i = 0; i < polyhedrons.size(); ++i) {
            convertPolyhedronToMatrix(polyhedrons[i], h_polys[i]);
        }
        return true;
    } catch (const std::exception& e) {
        ROS_ERROR("SFC generation exception: %s", e.what());
        return false;
    }
}

void DecompSFCGenerator::convertPolyhedronToMatrix(const Polyhedron3D& poly,
                                                   Eigen::MatrixX4d&  h_poly) const {
    const auto& hyperplanes = poly.hyperplanes();
    if (hyperplanes.empty()) {
        h_poly.resize(0, 4);
        return;
    }

    h_poly.resize(hyperplanes.size(), 4);
    for (size_t i = 0; i < hyperplanes.size(); ++i) {
        const auto& hp = hyperplanes[i];
        h_poly.row(i).head<3>() = hp.n_.template cast<double>();
        h_poly(i, 3)            = hp.n_.dot(hp.p_);
    }
}

bool DecompSFCGenerator::isPointInsideCorridor(const Eigen::Vector3d& point,
                                               const Eigen::MatrixX4d& h_poly) const {
    for (int i = 0; i < h_poly.rows(); ++i) {
        const double value = h_poly(i, 0) * point.x() + h_poly(i, 1) * point.y() +
                             h_poly(i, 2) * point.z();
        if (value > h_poly(i, 3) + safety_margin_) return false;
    }
    return true;
}

void DecompSFCGenerator::getVisualizationMesh(const std::vector<Eigen::MatrixX4d>& h_polys,
                                              visualization_msgs::Marker&           mesh_msg) {
    mesh_msg.points.clear();
    mesh_msg.colors.clear();

    mesh_msg.header.frame_id    = "map";
    mesh_msg.header.stamp       = ros::Time::now();
    mesh_msg.pose.orientation.w = 1.0;

    mesh_msg.type   = visualization_msgs::Marker::TRIANGLE_LIST;
    mesh_msg.action = visualization_msgs::Marker::ADD;
    mesh_msg.scale.x = mesh_msg.scale.y = mesh_msg.scale.z = 1.0;

    mesh_msg.color.r = 0.0;
    mesh_msg.color.g = 0.0;
    mesh_msg.color.b = 1.0;
    mesh_msg.color.a = 0.3;

    for (const auto& h_poly : h_polys) {
        if (h_poly.rows() < 4) continue;

        // Cube vertices centred at origin with edge length 2*local_bbox_size_
        const std::vector<Eigen::Vector3d> cube = {
            {-local_bbox_size_, -local_bbox_size_, -local_bbox_size_},
            {local_bbox_size_,  -local_bbox_size_, -local_bbox_size_},
            {local_bbox_size_,   local_bbox_size_, -local_bbox_size_},
            {-local_bbox_size_,  local_bbox_size_, -local_bbox_size_},
            {-local_bbox_size_, -local_bbox_size_,  local_bbox_size_},
            {local_bbox_size_,  -local_bbox_size_,  local_bbox_size_},
            {local_bbox_size_,   local_bbox_size_,  local_bbox_size_},
            {-local_bbox_size_,  local_bbox_size_,  local_bbox_size_}};

        std::vector<Eigen::Vector3d> verts;
        verts.reserve(cube.size());
        for (const auto& v : cube)
            if (isPointInsideCorridor(v, h_poly)) verts.push_back(v);

        for (size_t i = 1; i + 1 < verts.size(); ++i) {
            geometry_msgs::Point p0, p1, p2;
            p0.x = verts[0].x(); p0.y = verts[0].y(); p0.z = verts[0].z();
            p1.x = verts[i].x(); p1.y = verts[i].y(); p1.z = verts[i].z();
            p2.x = verts[i + 1].x(); p2.y = verts[i + 1].y(); p2.z = verts[i + 1].z();

            mesh_msg.points.insert(mesh_msg.points.end(), {p0, p1, p2});

            std_msgs::ColorRGBA color;
            color.r = 0.0; color.g = 0.0; color.b = 1.0; color.a = 0.3;
            mesh_msg.colors.insert(mesh_msg.colors.end(), {color, color, color});
        }
    }
}

// =============================================================================================
// DecompPlanner
// =============================================================================================

class DecompPlanner {
public:
    DecompPlanner(ros::NodeHandle& nh_pub, ros::NodeHandle& nh_priv);

private:
    // ROS essentials
    ros::NodeHandle nh_;
    ros::NodeHandle nh_priv_;
    ros::Subscriber map_sub_;
    ros::Subscriber target_sub_;
    ros::Publisher  mesh_pub_;

    // Internal state
    voxel_map::VoxelMap voxel_map_;
    DecompSFCGenerator   decomp_gen_;
    Visualizer           visualizer_;

    bool map_ready_{false};
    std::vector<Eigen::Vector3d> start_goal_;

    // Parameters
    std::vector<double> map_bound_{6, 0.0};
    double voxel_width_{0.1};
    double dilate_radius_{0.1};
    double planner_timeout_{5.0};

    // ------------------------------------------------------------------
    void setupParams();
    void mapCallback(const sensor_msgs::PointCloud2::ConstPtr& msg);
    void targetCallback(const geometry_msgs::PoseStamped::ConstPtr& msg);

    void plan();
    void visualizePathAndSFC(const std::vector<Eigen::Vector3d>&      path,
                             const std::vector<Eigen::MatrixX4d>& hpolys);
    void visualizePathOnly(const std::vector<Eigen::Vector3d>& path);
};

// -------------------------------------------------------------------------------------------------
// DecompPlanner implementation
// -------------------------------------------------------------------------------------------------

DecompPlanner::DecompPlanner(ros::NodeHandle& nh_pub, ros::NodeHandle& nh_priv)
    : nh_(nh_pub), nh_priv_(nh_priv), visualizer_(nh_priv) {
    map_sub_    = nh_.subscribe("map", 1, &DecompPlanner::mapCallback, this);
    target_sub_ = nh_.subscribe("goal", 1, &DecompPlanner::targetCallback, this);
    mesh_pub_   = nh_.advertise<visualization_msgs::Marker>("sfc_mesh", 1);

    setupParams();
}

void DecompPlanner::setupParams() {
    double map_x, map_y, map_z;
    double origin_x, origin_y, origin_z;
    double resolution, inflate_radius, timeout, bbox, margin;

    nh_priv_.param("map/x_size", map_x, 20.0);
    nh_priv_.param("map/y_size", map_y, 20.0);
    nh_priv_.param("map/z_size", map_z, 5.0);

    nh_priv_.param("map/x_origin", origin_x, -10.0);
    nh_priv_.param("map/y_origin", origin_y, -10.0);
    nh_priv_.param("map/z_origin", origin_z, 0.0);

    nh_priv_.param("map/resolution",     resolution,     0.1);
    nh_priv_.param("map/inflate_radius", inflate_radius, 0.1);
    nh_priv_.param("planner/timeout",    timeout,        5.0);

    nh_priv_.param("decomp_sfc/bbox_size",     bbox,   2.0);
    nh_priv_.param("decomp_sfc/safety_margin", margin, 0.2);

    voxel_width_     = resolution;
    dilate_radius_   = inflate_radius;
    planner_timeout_ = timeout;

    map_bound_[0] = origin_x;
    map_bound_[1] = origin_x + map_x;
    map_bound_[2] = origin_y;
    map_bound_[3] = origin_y + map_y;
    map_bound_[4] = origin_z;
    map_bound_[5] = origin_z + map_z;

    const Eigen::Vector3i xyz((map_bound_[1] - map_bound_[0]) / voxel_width_,
                              (map_bound_[3] - map_bound_[2]) / voxel_width_,
                              (map_bound_[5] - map_bound_[4]) / voxel_width_);
    const Eigen::Vector3d offset(map_bound_[0], map_bound_[2], map_bound_[4]);

    voxel_map_ = voxel_map::VoxelMap(xyz, offset, voxel_width_);
    decomp_gen_.setVoxelMap(&voxel_map_, dilate_radius_);
    decomp_gen_.setParameters(bbox, margin);
}

void DecompPlanner::mapCallback(const sensor_msgs::PointCloud2::ConstPtr& msg) {
    if (map_ready_) return;

    const size_t total_points = msg->data.size() / msg->point_step;
    const auto*  fdata        = reinterpret_cast<const float*>(&msg->data[0]);

    for (size_t i = 0; i < total_points; ++i) {
        const size_t base = i * (msg->point_step / sizeof(float));
        const float  x    = fdata[base + 0];
        const float  y    = fdata[base + 1];
        const float  z    = fdata[base + 2];

        if (std::isfinite(x) && std::isfinite(y) && std::isfinite(z)) {
            const Eigen::Vector3d pos(x, y, z);
            voxel_map_.setOccupied(pos);
        }
    }

    voxel_map_.dilate(static_cast<int>(std::ceil(dilate_radius_ / voxel_map_.getScale())));
    map_ready_ = true;
    ROS_INFO("Map initialized with %zu points", total_points);
}

void DecompPlanner::targetCallback(const geometry_msgs::PoseStamped::ConstPtr& msg) {
    if (!map_ready_) return;

    // Reset start/goal container if both are already set
    if (start_goal_.size() >= 2) start_goal_.clear();

    const double z_goal = map_bound_[4] + dilate_radius_ +
                          std::abs(msg->pose.orientation.z) *
                              (map_bound_[5] - map_bound_[4] - 2 * dilate_radius_);

    const Eigen::Vector3d goal(msg->pose.position.x, msg->pose.position.y, z_goal);

    if (voxel_map_.query(goal) == 0) {
        visualizer_.visualizeStartGoal(goal, 0.25, start_goal_.size());
        start_goal_.push_back(goal);
        ROS_INFO("Setting goal: Position(%.3f, %.3f, %.3f)", goal.x(), goal.y(), goal.z());
    } else {
        ROS_WARN("The selected position is not feasible!");
    }

    plan();
}

void DecompPlanner::plan() {
    if (start_goal_.size() != 2) return;

    std::vector<Eigen::Vector3d> path;

    const Eigen::Vector3d low_corner(map_bound_[0], map_bound_[2], map_bound_[4]);
    const Eigen::Vector3d high_corner(map_bound_[1], map_bound_[3], map_bound_[5]);

    auto t_start = std::chrono::high_resolution_clock::now();

    const double cost = sfc_gen::planPath(start_goal_[0], start_goal_[1], low_corner,
                                          high_corner, &voxel_map_, planner_timeout_, path);

    if (cost < std::numeric_limits<double>::infinity() && path.size() > 1) {
        const auto t_end = std::chrono::high_resolution_clock::now();
        const auto dt_ms =
            std::chrono::duration_cast<std::chrono::milliseconds>(t_end - t_start).count();

        ROS_INFO("Planning time: %ld ms | Path length: %.3f | Points: %zu", dt_ms, cost,
                 path.size());

        std::vector<Eigen::MatrixX4d> hpolys;
        if (decomp_gen_.generate(path, hpolys)) {
            visualizePathAndSFC(path, hpolys);
        } else {
            ROS_WARN("SFC generation failed");
            visualizePathOnly(path);
        }
    } else {
        ROS_WARN("Path planning failed");
    }
}

void DecompPlanner::visualizePathAndSFC(const std::vector<Eigen::Vector3d>& path,
                                        const std::vector<Eigen::MatrixX4d>& hpolys) {
    Trajectory<5> empty_traj;
    visualizer_.visualize(empty_traj, path);
    visualizer_.visualizePolytope(hpolys);

    visualization_msgs::Marker mesh_msg;
    decomp_gen_.getVisualizationMesh(hpolys, mesh_msg);
    mesh_pub_.publish(mesh_msg);

    visualizer_.visualizeText("Path: " + std::to_string(path.size()) +
                              " points, SFC: " + std::to_string(hpolys.size()) + " corridors");
}

void DecompPlanner::visualizePathOnly(const std::vector<Eigen::Vector3d>& path) {
    Trajectory<5> empty_traj;
    visualizer_.visualize(empty_traj, path);
    visualizer_.visualizeText("Path only: " + std::to_string(path.size()) + " points");
}

// =============================================================================================
// main
// =============================================================================================

int main(int argc, char** argv) {
    ros::init(argc, argv, "decomp_planning_node");

    ros::NodeHandle nh;
    ros::NodeHandle nh_priv("~");

    DecompPlanner planner(nh, nh_priv);

    ros::Rate rate(100);
    while (ros::ok()) {
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
