#include "gcopter/visualizer.hpp"
#include "gcopter/voxel_map.hpp"
#include "gcopter/sfc_gen.hpp"


#include <ros/console.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/PointCloud2.h>
#include <chrono>

class SimplePlanner
{
private:
    ros::NodeHandle nh;
    ros::Subscriber mapSub, targetSub;

    bool mapInitialized;
    voxel_map::VoxelMap voxelMap;
    Visualizer visualizer;
    std::vector<Eigen::Vector3d> startGoal;

    std::string mapTopic, targetTopic;
    double dilateRadius;
    double voxelWidth;
    std::vector<double> mapBound;
    std::string frame_id;
    double sfcProgress;
    double sfcRange;
    double plannerTimeout;

public:
    SimplePlanner(ros::NodeHandle &nh_, ros::NodeHandle &nh_private)
        : nh(nh_),
          mapInitialized(false),
          visualizer(nh_private)
    {
        nh_private.param("MapTopic", mapTopic, std::string("/structure_map/global_gridmap"));
        nh_private.param("TargetTopic", targetTopic, std::string("/goal"));
        nh_private.param("frame_id", frame_id, std::string("odom"));

        Eigen::Vector3d map_size;
        mapBound.resize(6);

        nh_private.param("map/x_size", map_size(0), 40.0);
        nh_private.param("map/y_size", map_size(1), 40.0);
        nh_private.param("map/z_size", map_size(2), 5.0);
        nh_private.param("map/x_origin", mapBound[0], -20.0);
        nh_private.param("map/y_origin", mapBound[2], -20.0);
        nh_private.param("map/z_origin", mapBound[4], 0.0);
        nh_private.param("map/resolution", voxelWidth, 0.1);
        nh_private.param("map/inflate_radius", dilateRadius, 0.1);

        // SFC parameters
        nh_private.param("sfc/progress", sfcProgress, 5.0);
        nh_private.param("sfc/range", sfcRange, 5.0);
        nh_private.param("sfc/timeout", plannerTimeout, 5.0);

        mapBound[1] = mapBound[0] + map_size(0);
        mapBound[3] = mapBound[2] + map_size(1);
        mapBound[5] = mapBound[4] + map_size(2);

        const Eigen::Vector3i xyz((mapBound[1] - mapBound[0]) / voxelWidth,
                                  (mapBound[3] - mapBound[2]) / voxelWidth,
                                  (mapBound[5] - mapBound[4]) / voxelWidth);

        const Eigen::Vector3d offset(mapBound[0], mapBound[2], mapBound[4]);

        voxelMap = voxel_map::VoxelMap(xyz, offset, voxelWidth);

        mapSub = nh.subscribe(mapTopic, 1, &SimplePlanner::mapCallBack, this,
                              ros::TransportHints().tcpNoDelay());

        targetSub = nh.subscribe(targetTopic, 1, &SimplePlanner::targetCallBack, this,
                                 ros::TransportHints().tcpNoDelay());

        ROS_INFO("Simple Planner initialized");
        ROS_INFO("Map topic: %s", mapTopic.c_str());
        ROS_INFO("Target topic: %s", targetTopic.c_str());
        ROS_INFO("Frame ID: %s", frame_id.c_str());
    }

    inline void mapCallBack(const sensor_msgs::PointCloud2::ConstPtr &msg)
    {
        if (!mapInitialized)
        {
            size_t cur = 0;
            const size_t total = msg->data.size() / msg->point_step;
            float *fdata = (float *)(&msg->data[0]);
            for (size_t i = 0; i < total; i++)
            {
                cur = msg->point_step / sizeof(float) * i;

                if (std::isnan(fdata[cur + 0]) || std::isinf(fdata[cur + 0]) ||
                    std::isnan(fdata[cur + 1]) || std::isinf(fdata[cur + 1]) ||
                    std::isnan(fdata[cur + 2]) || std::isinf(fdata[cur + 2]))
                {
                    continue;
                }
                voxelMap.setOccupied(Eigen::Vector3d(fdata[cur + 0],
                                                        fdata[cur + 1],
                                                        fdata[cur + 2]));
            }

            voxelMap.dilate(std::ceil(dilateRadius / voxelMap.getScale()));

            mapInitialized = true;
            ROS_INFO("Map initialized with %zu points", total);
        }
    }

    inline void plan()
    {
        if (startGoal.size() == 2)
        {
            std::vector<Eigen::Vector3d> path;
            
            auto t1 = std::chrono::high_resolution_clock::now();
            printf("\033[32m ============================ start planning ===================================\n\033[0m");

            // use OMPL to plan path
            const Eigen::Vector3d lowCorner(mapBound[0], mapBound[2], mapBound[4]);
            const Eigen::Vector3d highCorner(mapBound[1], mapBound[3], mapBound[5]);
            
            double cost = sfc_gen::planPath(startGoal[0], startGoal[1], 
                                          lowCorner, highCorner, 
                                          &voxelMap, plannerTimeout, path);

            if (cost < INFINITY && path.size() > 1)
            {
                auto t2 = std::chrono::high_resolution_clock::now();
                std::chrono::duration<double, std::milli> fp_ms = t2 - t1;
                std::cout << "planning time: " << fp_ms.count() << " ms" << std::endl;
                std::cout << "path length: " << cost << std::endl;
                std::cout << "path point number: " << path.size() << std::endl;

                std::vector<Eigen::MatrixX4d> hpolys;
                generateSFC(path, hpolys);

                visualizePathAndSFC(path, hpolys);
            }
            else
            {
                ROS_WARN("planning failed!");
            }
        }
    }

    inline void generateSFC(const std::vector<Eigen::Vector3d> &path, 
                           std::vector<Eigen::MatrixX4d> &hpolys)
    {
        // get obstacle points from map
        std::vector<Eigen::Vector3d> obsPoints;
        const Eigen::Vector3i &voxelNum = voxelMap.getSize();
        const Eigen::Vector3d &voxelOrigin = voxelMap.getOrigin();
        const double scale = voxelMap.getScale();

        for (int x = 0; x < voxelNum(0); x++)
        {
            for (int y = 0; y < voxelNum(1); y++)
            {
                for (int z = 0; z < voxelNum(2); z++)
                {
                    if (voxelMap.query(Eigen::Vector3i(x, y, z)) == 1)
                    {
                        Eigen::Vector3d obsPoint = voxelOrigin + 
                            Eigen::Vector3d(x * scale, y * scale, z * scale);
                        obsPoints.push_back(obsPoint);
                    }
                }
            }
        }

        ROS_INFO("obstacle point number: %zu", obsPoints.size());

        // generate convex cover
        const Eigen::Vector3d lowCorner(mapBound[0], mapBound[2], mapBound[4]);
        const Eigen::Vector3d highCorner(mapBound[1], mapBound[3], mapBound[5]);

        sfc_gen::convexCover(path, obsPoints, lowCorner, highCorner, 
                           sfcProgress, sfcRange, hpolys);

        sfc_gen::shortCut(hpolys);

        ROS_INFO("generate %zu SFC", hpolys.size());
    }

    inline void visualizePathAndSFC(const std::vector<Eigen::Vector3d> &path,
                                   const std::vector<Eigen::MatrixX4d> &hpolys)
    {
        Trajectory<5> emptyTraj;
        
        visualizer.visualize(emptyTraj, path);
        
        visualizer.visualizePolytope(hpolys);
        
        std::string info = "Path: " + std::to_string(path.size()) + " points, " +
                          "SFC: " + std::to_string(hpolys.size()) + " corridors";
        visualizer.visualizeText(info);
    }

    inline void targetCallBack(const geometry_msgs::PoseStamped::ConstPtr &msg)
    {
        if (mapInitialized)
        {
            if (startGoal.size() >= 2)
            {
                startGoal.clear();
            }
            
            const double zGoal = mapBound[4] + dilateRadius +
                                 fabs(msg->pose.orientation.z) *
                                     (mapBound[5] - mapBound[4] - 2 * dilateRadius);
            const Eigen::Vector3d goal(msg->pose.position.x, msg->pose.position.y, zGoal);
            
            if (voxelMap.query(goal) == 0)
            {
                visualizer.visualizeStartGoal(goal, 0.25, startGoal.size());
                startGoal.emplace_back(goal);
                ROS_INFO("add target point: (%.2f, %.2f, %.2f)", goal(0), goal(1), goal(2));
            }
            else
            {
                ROS_WARN("the selected position is not feasible!");
            }

            plan();
        }
        return;
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_planning_node");
    ros::NodeHandle nh_, nh_private("~");

    SimplePlanner simple_planner(nh_, nh_private);

    ros::Rate lr(100);  
    while (ros::ok())
    {
        ros::spinOnce();
        lr.sleep();
    }

    return 0;
} 