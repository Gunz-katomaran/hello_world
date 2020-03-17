#include <pluginlib/class_list_macros.h>
#include "path_planner.h"

 //register this planner as a BaseGlobalPlanner plugin
 PLUGINLIB_EXPORT_CLASS(path_planner::PathPlanner, nav_core::BaseGlobalPlanner)

 using namespace std;

 //Default Constructor
 namespace path_planner {

 PathPlanner::PathPlanner (){

 }

 PathPlanner::PathPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros){
   initialize(name, costmap_ros);
 }


 void PathPlanner::initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros){
   ros::NodeHandle private_nh("~/" + name);
   plan_pub_ = private_nh.advertise<nav_msgs::Path>("plan", 1);
   graph_srv = private_nh.advertiseService("getPath", &PathPlanner::updateGraphService, this);
   marker_pub = private_nh.advertise<visualization_msgs::Marker>("waypoint_marker", 1);
   find_path = private_nh.serviceClient<path_planner::PathFinder>("/path_finder_service");
   orientation_filler_.setMode(1); //forward orientation

 }

 double PathPlanner::distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2)
  {
    return hypot(p1.position.x - p2.position.x, p1.position.y - p2.position.y);
  }

  bool PathPlanner::updateGraphService(path_planner::Graph::Request& req, path_planner::Graph::Response& resp){

    roadMap_ = req.adjacency_list;
    publishWP(roadMap_.map);
    std::cout<< "adjacency list" <<req;
    return 1;
}

void PathPlanner::publishWP(const std::vector<roadmap_global_planner_msgs::MapPair>& WP){
    for(int i = 0; i < WP.size(); i++){
        visualization_msgs::Marker marker;
        // Set the frame ID and timestamp.  See the TF tutorials for information on these.
        marker.header.frame_id = "/map";
        marker.header.stamp = ros::Time::now();

        // Set the namespace and id for this marker.  This serves to create a unique ID
        // Any marker sent with the same namespace and id will overwrite the old one
    
        marker.id = i;

        // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
        marker.type = visualization_msgs::Marker::SPHERE;

        // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
        marker.action = visualization_msgs::Marker::ADD;

        // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
        marker.pose.position.x = WP[i].pose.position.x;
        marker.pose.position.y = WP[i].pose.position.y;
        marker.pose.position.z = WP[i].pose.position.z;
        marker.pose.orientation.x = WP[i].pose.orientation.x;
        marker.pose.orientation.y = WP[i].pose.orientation.y;
        marker.pose.orientation.z = WP[i].pose.orientation.z;
        marker.pose.orientation.w = WP[i].pose.orientation.w;

        // Set the scale of the marker -- 1x1x1 here means 1m on a side
        marker.scale.x = 0.1;
        marker.scale.y = 0.1;
        marker.scale.z = 0.1;

        // Set the color -- be sure to set alpha to something non-zero!
        marker.color.r = 0.0f;
        marker.color.g = 0.0f;
        marker.color.b = 1.0f;
        marker.color.a = 1.0;

        std::stringstream ss;
        ss<<"Waypoint_"<<i;
        std::string str = ss.str();
        marker.text = str;
        ros::Duration seconds(600.0);
        marker.lifetime = seconds;
        marker_pub.publish(marker);
    }
}

int PathPlanner::findNearestNode(geometry_msgs::Pose p){
    int dist = 999999;
    int node = 999999;
    for (int i = 0; i < roadMap_.map.size(); i++ ){
        if(distance(p, roadMap_.map[i].pose) < dist){
            dist = distance(p, roadMap_.map[i].pose);
            node = roadMap_.map[i].node;
        }
    }
    return node;
}

 bool PathPlanner::makePlan(const geometry_msgs::PoseStamped& start, const geometry_msgs::PoseStamped& goal,  std::vector<geometry_msgs::PoseStamped>& plan ){
    cout << "start pose"<< start ;
    cout << "goal pose"<< goal;
    unsigned int start_node = findNearestNode(start.pose);
    unsigned int goal_node = findNearestNode(goal.pose);
    path_planner::PathFinder srv;
    srv.request.start = start_node;
    srv.request.goal = goal_node;
    std::vector<int> shortest_path;
    if (find_path.call(srv)){
        shortest_path = srv.response.path;
    }
    cout << "nearest node____start___" << start_node << "\n";
    cout << "nearest node____goal___" << goal_node << "\n";
    
    plan.push_back(start);
    geometry_msgs::PoseStamped start_p,stop_p;
    geometry_msgs::Pose points;
    start_p = start;
    stop_p = goal;
    double vector[2],mag;
    for (int i = 0; i< shortest_path.size(); i++){
        cout << "shortest_path" << shortest_path[i] << "\n";
        cout << "adjacent points ___" << roadMap_.map[shortest_path[i]].pose << "\n";

        points = roadMap_.map[shortest_path[i]].pose;
        mag = distance(start_p.pose,points);
        vector[0] = (points.position.x - start_p.pose.position.x) / mag ;
        vector[1] = (points.position.y - start_p.pose.position.y) / mag ;
        cout << "distance" << mag ;
        while(distance(start_p.pose,points) > 0.01 ){
          plan.push_back(start_p);
          start_p.pose.position.x += 0.01 * vector[0];
          start_p.pose.position.y += 0.01 * vector[1];
          //cout << "x inc" << start_p.pose.position.x << "\n";
          //cout << "y inc" << start_p.pose.position.y << "\n";
          start_p.header.stamp = ros::Time::now();
          start_p.pose.orientation.x = 0.0;
          start_p.pose.orientation.y = 0.0;
          start_p.pose.orientation.z = 0.0;
          start_p.pose.orientation.w = 1.0;
      }
    }
   /*for (int i=0; i<20; i++){
     geometry_msgs::PoseStamped new_goal = goal;
     tf::Quaternion goal_quat = tf::createQuaternionFromYaw(1.54);

      new_goal.pose.position.x = -9.0+(0.05*i);
      new_goal.pose.position.y = -0.0+(0.05*i);

      new_goal.pose.orientation.x = goal_quat.x();
      new_goal.pose.orientation.y = goal_quat.y();
      new_goal.pose.orientation.z = goal_quat.z();
      new_goal.pose.orientation.w = goal_quat.w();

   plan.push_back(new_goal);
   }*/
   plan.push_back(goal);
   orientation_filler_.processPath(start,  plan);
   publishPlan(plan);
  return true;
 }

 void PathPlanner::publishPlan(const std::vector<geometry_msgs::PoseStamped>& path) {
    //create a message for the plan
    nav_msgs::Path gui_path;
    gui_path.poses.resize(path.size());

    gui_path.header.frame_id = "/map";
    gui_path.header.stamp = ros::Time::now();

    // Extract the plan in world co-ordinates, we assume the path is all in the same frame
    for (unsigned int i = 0; i < path.size(); i++) {
        gui_path.poses[i] = path[i];
    }

    plan_pub_.publish(gui_path);
}
 };
