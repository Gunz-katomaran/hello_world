#ifndef _PATHFOLLOWER_H
#define _PATHFOLLOWER_H

 #include <ros/ros.h>
 #include <geometry_msgs/PoseStamped.h>
 #include <geometry_msgs/Point.h>
 #include <geometry_msgs/Pose.h>
 #include <nav_msgs/Path.h>
 #include <nav_msgs/GetPlan.h>
 #include <costmap_2d/costmap_2d_ros.h>
 #include <costmap_2d/costmap_2d.h>
 #include <nav_core/base_global_planner.h>
 #include <geometry_msgs/PoseStamped.h>
 #include <angles/angles.h>
 #include <base_local_planner/world_model.h>
 #include <base_local_planner/costmap_model.h>
 #include <string>
 #include <iostream>
 #include <path_follower/PointLoad.h>
 #include <path_follower/GoalLoad.h>
 #include <path_follower/Nearest.h>
 #include <path_follower/PointList.h>
 #include <path_follower/PoseList.h>
 #include <vector>
 #include <map>
 #include <cmath>
 #include <math.h>
 #include <visualization_msgs/Marker.h>

 namespace path_follower {

 class PathFollower : public nav_core::BaseGlobalPlanner {
    public:

    PathFollower();
    PathFollower(std::string name, costmap_2d::Costmap2DROS* costmap_ros);

  /** overridden classes from interface nav_core::BaseGlobalPlanner **/
    void initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros);
    bool makePlan(const geometry_msgs::PoseStamped& start,
                const geometry_msgs::PoseStamped& goal,
                std::vector<geometry_msgs::PoseStamped>& plan
               );
    bool updatePointService(path_follower::PointLoad::Request& req, path_follower::PointLoad::Response& resp);
    bool updateGoalService(path_follower::GoalLoad::Request& req, path_follower::GoalLoad::Response& resp);
    double distance(const geometry_msgs::Pose& p1, const path_follower::PoseList& p2);
    void findNearestNode(geometry_msgs::Pose p,double* add_distance,int* add_node);
    int goal_search(const geometry_msgs::Pose p);
    ros::Publisher plan_pub_;
    ros::ServiceClient nearest_srv;
    int middlePose(int size);
    private:
    int goal_point;
    ros::ServiceServer point_srv,goal_srv;
    path_follower::PointList point_list_;
    path_follower::PoseList next_pose;
    void straightPlan(geometry_msgs::PoseStamped& start, path_follower::PoseList& goal, std::vector<geometry_msgs::PoseStamped>& plan);
    void Plan(geometry_msgs::PoseStamped& start,std::vector<geometry_msgs::PoseStamped>& plan, path_follower::PointList point_list_,int from, int to);
    void publishPlan(const std::vector<geometry_msgs::PoseStamped>& path);
    };
}
 #endif

