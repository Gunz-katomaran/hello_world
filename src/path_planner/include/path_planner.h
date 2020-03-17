 #ifndef _PATHPLANNER_H
 #define _PATHPLANNER_H

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
 #include <path_planner/Graph.h>
 #include <roadmap_global_planner_msgs/AdjacencyList.h>
 #include <vector>
 #include <map>
 #include <visualization_msgs/Marker.h>
 #include <path_planner/PathFinder.h>
 #include <orientation_filler.h>

 namespace path_planner {

 class PathPlanner : public nav_core::BaseGlobalPlanner {
    public:

    PathPlanner();
    PathPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros);

  /** overridden classes from interface nav_core::BaseGlobalPlanner **/
    void initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros);
    bool makePlan(const geometry_msgs::PoseStamped& start,
                const geometry_msgs::PoseStamped& goal,
                std::vector<geometry_msgs::PoseStamped>& plan
               );
    bool updateGraphService(path_planner::Graph::Request& req, path_planner::Graph::Response& resp);
    double distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2);
    int findNearestNode(geometry_msgs::Pose p);
    ros::Publisher plan_pub_;
    ros::Publisher marker_pub;
    ros::ServiceClient find_path;
    private:
    ros::ServiceServer graph_srv;
    OrientationFiller orientation_filler_;
    roadmap_global_planner_msgs::AdjacencyList roadMap_;
    void publishPlan(const std::vector<geometry_msgs::PoseStamped>& path);
    void publishWP(const std::vector<roadmap_global_planner_msgs::MapPair>& WP);
    };
}
 #endif
