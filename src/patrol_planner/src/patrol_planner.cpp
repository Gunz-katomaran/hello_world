#include <pluginlib/class_list_macros.h>
#include "patrol_planner.h"
#include <bits/stdc++.h>


//register this planner as a BaseGlobalPlanner plugin
PLUGINLIB_EXPORT_CLASS(patrol_planner::PatrolPlanner, nav_core::BaseGlobalPlanner)

using namespace std   ;

 //Default Constructor
namespace patrol_planner
{
PatrolPlanner::PatrolPlanner ():
bgp_loader_("nav_core", "nav_core::BaseGlobalPlanner")
{}

PatrolPlanner::PatrolPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros):
bgp_loader_("nav_core", "nav_core::BaseGlobalPlanner")

     {
        initialize(name, costmap_ros);
     }

void PatrolPlanner::initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros)
     {
         ros::NodeHandle private_nh("~/" + name);
         plan_pub_ = private_nh.advertise<nav_msgs::Path>("plan", 1);
         plan_srv = private_nh.serviceClient<patrol_planner::GetPlan>("/milestone/plan");
         std::string global_planner;
         global_planner = "global_planner/GlobalPlanner";
         try
         {
             bgp = bgp_loader_.createInstance(global_planner);
             bgp->initialize(bgp_loader_.getName(global_planner), costmap_ros);
         }
         catch (pluginlib::PluginlibException& ex)
         {
             ROS_ERROR("The plugin failed to load for some reason. Error: %s", ex.what());
         }
     }

double PatrolPlanner::distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2)
     {
         return hypot(p1.position.x - p2.position.x, p1.position.y - p2.position.y);
     }

void PatrolPlanner::straightPlan(geometry_msgs::PoseStamped& start, geometry_msgs::Pose& goal, std::vector<geometry_msgs::PoseStamped>& plan){
        double vector[2],mag;
        mag = distance(start.pose,goal);
        vector[0] = (goal.position.x - start.pose.position.x) / mag ;
        vector[1] = (goal.position.y - start.pose.position.y) / mag ;
        while(distance(start.pose,goal) > 0.01 ){
            plan.push_back(start);
            start.pose.position.x += 0.01 * vector[0];
            start.pose.position.y += 0.01 * vector[1];
            start.header.stamp = ros::Time::now();
            start.pose.orientation.x = 0;
            start.pose.orientation.y = 0;
            start.pose.orientation.z = goal.orientation.z;
            start.pose.orientation.w = goal.orientation.z;
      }
}
     
bool PatrolPlanner::makePlan(const geometry_msgs::PoseStamped& start, const geometry_msgs::PoseStamped& goal, std::vector<geometry_msgs::PoseStamped>& plan)
     {
         /** bgp->makePlan(start, goal, plan);
         publishPlan(plan);
         return true; **/
         std::vector<geometry_msgs::PoseStamped> bgp_plan;

         geometry_msgs::PoseStamped start_pose;
         start_pose = start;
         geometry_msgs::Pose next_pose;
         geometry_msgs::PoseStamped np_stamped,last_np_stamped;
         int list_size;
         cout << "input _____"<< start << goal << "\n";
         patrol_planner::GetPlan srv;
         srv.request.start = start;
         srv.request.goal = goal;
         if (plan_srv.call(srv)){
            pose_list_.pose_list = srv.response.pose_list;
            bgp_goal = srv.response.normal_goal;
            list_size = pose_list_.pose_list.size();
         }
         if (list_size > 1){
             cout << "pose list received by the planner\n";
             for (int i = 0; i< list_size; i++){
                 next_pose = pose_list_.pose_list[i];
                 np_stamped.header.stamp = ros::Time::now();
                 np_stamped.header.frame_id = "map";
                 np_stamped.pose.position.x = next_pose.position.x;
                 np_stamped.pose.position.y = next_pose.position.y;
                 np_stamped.pose.orientation.x = next_pose.orientation.x;
                 np_stamped.pose.orientation.y = next_pose.orientation.y;
                 np_stamped.pose.orientation.z = next_pose.orientation.z;
                 np_stamped.pose.orientation.w = next_pose.orientation.w;
                 //straightPlan(start_pose,next_pose,plan);
                 if (i == 0){
                 cout << "AAAAAAAAAAAAA" << start_pose << np_stamped<<"\n";
                 bgp->makePlan(start_pose, np_stamped, bgp_plan);
                 for (int j = 0; j< bgp_plan.size(); j++){
                     plan.push_back(bgp_plan[j]);
                 }                     
                 }
                 else if (i > 0 & i < (list_size - 1) ){
                 straightPlan(last_np_stamped,next_pose,plan);
                 /**cout << "BBBBBBBBBBBBBBBBBBB" << last_np_stamped << np_stamped<<"\n";
                 bgp->makePlan(last_np_stamped, np_stamped, bgp_plan);
                 for (int k = 0; k< bgp_plan.size(); k++){
                     plan.push_back(bgp_plan[k]);
                 }**/
                 }
                 else if (i == (list_size - 1)){
                     if (bgp_goal){
                         bgp->makePlan(last_np_stamped, np_stamped, bgp_plan);
                         for (int k = 0; k< bgp_plan.size(); k++){
                         plan.push_back(bgp_plan[k]);
                         }
                     }
                     else{
                         straightPlan(last_np_stamped,next_pose,plan);
                     }
                 }
                 last_np_stamped = np_stamped;

            }
            plan.push_back(goal);
         }
         else{
             cout << "pose list not received by the planner >>>>>>>>> not going to move!!!!!\n";
             plan.push_back(start);
         }
         publishPlan(plan);
         return true;
         
     }

 void PatrolPlanner::publishPlan(const std::vector<geometry_msgs::PoseStamped>& path) {
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