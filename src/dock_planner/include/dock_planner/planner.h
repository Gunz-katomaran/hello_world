#ifndef _PLANNER_H
#define _PLANNER_H

#include <ros/ros.h>
#include <costmap_2d/costmap_2d.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
#include <nav_msgs/Path.h>
#include <tf/transform_datatypes.h>
#include <vector>
#include <nav_core/base_global_planner.h>
#include <nav_msgs/GetPlan.h>
#include <dynamic_reconfigure/server.h>
#include <iostream>
#include <std_msgs/String.h>
#include <geometry_msgs/Pose.h>
#include <map>
#include <visualization_msgs/Marker.h>
#include <string>
#include <sstream>
#include <geometry_msgs/Vector3.h>
namespace dock_planner {

class DockPlanner : public nav_core::BaseGlobalPlanner {
    public:
       
        DockPlanner();

        DockPlanner(std::string name, costmap_2d::Costmap2D* costmap, std::string frame_id);

        ~DockPlanner();


        void initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros);

        void initialize(std::string name, costmap_2d::Costmap2D* costmap, std::string frame_id);

        bool makePlan(const geometry_msgs::PoseStamped& start, const geometry_msgs::PoseStamped& goal,
                      std::vector<geometry_msgs::PoseStamped>& plan);

       

        double distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2);


        ros::Publisher plan_pub_;

    private:
 
        costmap_2d::Costmap2D* costmap_;
        std::string frame_id_;
        std::string tf_prefix_;
        bool initialized_;
        void publishPlan(const std::vector<geometry_msgs::PoseStamped>& path);
        

};

} //end namespace roadmap_global_planner

#endif
