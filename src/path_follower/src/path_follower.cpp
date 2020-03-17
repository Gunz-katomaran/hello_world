#include <pluginlib/class_list_macros.h>
#include "path_follower.h"
#include <bits/stdc++.h>
int ite = 1;
int once = 1;
int k = 0;
int nearest_point, midPoint, firstGoal, lastPoint,currentPoint,nextGoal,firstPoint,destPoint,last_destPoint,goalPoint;
double np_distance;
bool inMid,output,received;

PLUGINLIB_EXPORT_CLASS(path_follower::PathFollower, nav_core::BaseGlobalPlanner)

using namespace std;

namespace path_follower {
PathFollower::PathFollower(){

}

PathFollower::PathFollower(std::string name, costmap_2d::Costmap2DROS* costmap_ros){
    initialize(name, costmap_ros);
}
void PathFollower::initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros){
   ros::NodeHandle private_nh("~/" + name);
   plan_pub_ = private_nh.advertise<nav_msgs::Path>("plan", 1);
   point_srv = private_nh.advertiseService("getPath", &PathFollower::updatePointService, this);
   goal_srv = private_nh.advertiseService("getGoal", &PathFollower::updateGoalService, this);
   nearest_srv = private_nh.serviceClient<path_follower::Nearest>("/nearestPoint_service");
 }

double PathFollower::distance(const geometry_msgs::Pose& p1, const path_follower::PoseList& p2)
  {
    return sqrt(pow((p2.list[0] - p1.position.x),2.0) + pow((p2.list[1] - p1.position.y),2.0));
  }

bool PathFollower::updatePointService(path_follower::PointLoad::Request& req, path_follower::PointLoad::Response& resp){

    point_list_ = req.point_list;
    return 1;
}

bool PathFollower::updateGoalService(path_follower::GoalLoad::Request& req, path_follower::GoalLoad::Response& resp){
    goal_point = req.goal;
    return 1;
}

void PathFollower::findNearestNode(geometry_msgs::Pose p,double* add_distance,int* add_node){
    double first;
    int place;
    first = INT_MAX;
    double distance_list[point_list_.pose_list.size()];
    for (int i = 0; i < point_list_.pose_list.size(); i++ ){
        distance_list[i] = distance(p,point_list_.pose_list[i]);
    }
    for (int j = 0; j < point_list_.pose_list.size(); j++){
        if(distance_list[j] < first){
            first = distance_list[j];
            place = j;
            *add_distance = first;
            *add_node = place;
        }
    }
}

int PathFollower::middlePose(int size){
    int middle;
    middle = size/2;
    return middle;
}

void PathFollower::straightPlan(geometry_msgs::PoseStamped& start, path_follower::PoseList& goal, std::vector<geometry_msgs::PoseStamped>& plan){
        double vector[2],mag;
        mag = distance(start.pose,goal);
        vector[0] = (goal.list[0] - start.pose.position.x) / mag ;
        vector[1] = (goal.list[1] - start.pose.position.y) / mag ;
        while(distance(start.pose,goal) > 0.01 ){
            plan.push_back(start);
            start.pose.position.x += 0.01 * vector[0];
            start.pose.position.y += 0.01 * vector[1];
            start.header.stamp = ros::Time::now();
            start.pose.orientation.x = 0;
            start.pose.orientation.y = 0;
            start.pose.orientation.z = goal.list[2];
            start.pose.orientation.w = goal.list[3];
      }
}

void PathFollower::Plan(geometry_msgs::PoseStamped& start,std::vector<geometry_msgs::PoseStamped>& plan, path_follower::PointList point_list_,int from, int to){
            for (int l = from; l < to; l++ ){
                plan.push_back(start);
                next_pose = point_list_.pose_list[l];
                start.pose.position.x = next_pose.list[0];
                start.pose.position.y = next_pose.list[1];
                start.header.stamp = ros::Time::now();
                start.pose.orientation.x = 0;
                start.pose.orientation.y = 0;
                start.pose.orientation.z = next_pose.list[2];
                start.pose.orientation.w = next_pose.list[3];

        }
}

bool PathFollower::makePlan(const geometry_msgs::PoseStamped& start, const geometry_msgs::PoseStamped& goal,  std::vector<geometry_msgs::PoseStamped>& plan ){

    plan.push_back(start);
    geometry_msgs::PoseStamped start_p;
    start_p = start;
    path_follower::PoseList goal_pose;
    firstPoint = 0;
    lastPoint = point_list_.pose_list.size();
    midPoint = middlePose(point_list_.pose_list.size());
    goalPoint = goal_point;
    cout << "received goalPoint" << goalPoint;
    findNearestNode(start.pose,&np_distance,&nearest_point);
    path_follower::Nearest srv;
    srv.request.near = nearest_point;
    if (nearest_srv.call(srv)){
        output = srv.response.result;
    }
    if (output){
        cout << "nearest point is received by the client" << nearest_point << "\n";
    }
    else{
        cout << "service not working\n";
    }
    goal_pose = point_list_.pose_list[nearest_point];
    straightPlan(start_p,goal_pose,plan);
    if (nearest_point >= 0 && goalPoint <= nearest_point){
        if (nearest_point == goalPoint){
            Plan(start_p,plan,point_list_,nearest_point,goalPoint);
        }
        else{
        Plan(start_p,plan,point_list_,nearest_point,lastPoint);
        goal_pose = point_list_.pose_list[0];
        straightPlan(start_p,goal_pose,plan);
        Plan(start_p,plan,point_list_,firstPoint,goalPoint);
        }
    }
    else{
    Plan(start_p,plan,point_list_,nearest_point,goalPoint);
    }
    publishPlan(plan);
    last_destPoint = destPoint;
    return true;
 }

  void PathFollower::publishPlan(const std::vector<geometry_msgs::PoseStamped>& path) {
    nav_msgs::Path gui_path;
    gui_path.poses.resize(path.size());

    gui_path.header.frame_id = "/map";
    gui_path.header.stamp = ros::Time::now();
    for (unsigned int i = 0; i < path.size(); i++) {
        gui_path.poses[i] = path[i];
    }

    plan_pub_.publish(gui_path);
}
};