#ifndef _PATROLPLANNER_H
#define _PATROLPLANNER_H

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Pose.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/GetPlan.h>
#include <costmap_2d/costmap_2d_ros.h>
#include <costmap_2d/costmap_2d.h>
#include <nav_core/base_global_planner.h>
#include <base_local_planner/world_model.h>
#include <base_local_planner/costmap_model.h>
#include <patrol_planner/PoseList.h>
#include <patrol_planner/GetPlan.h>
#include <patrol_planner/GetPlanResponse.h>
#include <iostream>
#include <vector>
#include <move_base/move_base.h>

#include <pluginlib/class_loader.h>


namespace  patrol_planner
{
    class PatrolPlanner : public nav_core::BaseGlobalPlanner
    {
        public:
        
        PatrolPlanner();
        PatrolPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros);

        /** overridden classes from interface nav_core::BaseGlobalPlanner **/
        void initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros);
        bool makePlan(const geometry_msgs::PoseStamped& start,
                      const geometry_msgs::PoseStamped& goal,
                      std::vector<geometry_msgs::PoseStamped>& plan
                      );
        double distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2);

        ros::Publisher plan_pub_;
        ros::ServiceClient plan_srv;
        private:
        boost::shared_ptr<nav_core::BaseGlobalPlanner> bgp;
        pluginlib::ClassLoader<nav_core::BaseGlobalPlanner> bgp_loader_;
        patrol_planner::GetPlanResponse pose_list_;
        bool bgp_goal;
        void straightPlan(geometry_msgs::PoseStamped& start, geometry_msgs::Pose& goal, std::vector<geometry_msgs::PoseStamped>& plan);
        void publishPlan(const std::vector<geometry_msgs::PoseStamped>& path);
    };
};
#endif
 