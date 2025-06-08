#ifndef DECOMP_SFC_GENERATOR_HPP
#define DECOMP_SFC_GENERATOR_HPP

#include <ros/ros.h>
#include <Eigen/Dense>
#include <vector>
#include <visualization_msgs/Marker.h>
#include <std_msgs/ColorRGBA.h>

#include <decomp_util/ellipsoid_decomp.h>
#include <decomp_basis/data_type.h>
#include <decomp_geometry/polyhedron.h>

class DecompSFCGenerator
{
private:
    double local_bbox_size_;
    double safety_margin_;
    
    EllipsoidDecomp3D decomp_util_;
    
    void convertPolyhedronToMatrix(const Polyhedron3D& poly,
                                  Eigen::MatrixX4d& h_poly);

public:
    DecompSFCGenerator();
    ~DecompSFCGenerator();
    
    void setParameters(double bbox_size, double safety_margin);
    
    
    bool generateSFC(const std::vector<Eigen::Vector3d>& path,
                    const std::vector<Eigen::Vector3d>& obstacle_cloud,
                    std::vector<Eigen::MatrixX4d>& h_polys);
    
    bool isPointInsideCorridor(const Eigen::Vector3d& point, 
                              const Eigen::MatrixX4d& h_poly);
    
    void getVisualizationMesh(const std::vector<Eigen::MatrixX4d>& h_polys,
                             visualization_msgs::Marker& mesh_msg);
};

#endif