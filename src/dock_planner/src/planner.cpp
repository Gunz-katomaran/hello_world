#include <dock_planner/planner.h>
#include <pluginlib/class_list_macros.h>
#include <tf/transform_listener.h>
#include <costmap_2d/cost_values.h>
#include <costmap_2d/costmap_2d.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>


//register this planner as a BaseGlobalPlanner plugin
PLUGINLIB_EXPORT_CLASS(dock_planner::DockPlanner, nav_core::BaseGlobalPlanner)

namespace dock_planner {


DockPlanner::DockPlanner() :
        costmap_(NULL), initialized_(false) {
   
}

DockPlanner::DockPlanner(std::string name, costmap_2d::Costmap2D* costmap, std::string frame_id) :
        costmap_(NULL), initialized_(false) {

    //initialize the planner
    initialize(name, costmap, frame_id);
}

DockPlanner::~DockPlanner() {

}

void DockPlanner::initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros) {

    initialize(name, costmap_ros->getCostmap(), costmap_ros->getGlobalFrameID());
}

void DockPlanner::initialize(std::string name, costmap_2d::Costmap2D* costmap, std::string frame_id) {

    if ( !initialized_ ) {
    
        ros::NodeHandle private_nh("~/" + name);
        costmap_ = costmap;
        frame_id_ = frame_id;

        //get the tf prefix
         ros::NodeHandle prefix_nh;
         tf_prefix_ = tf::getPrefixParam(prefix_nh);
          plan_pub_ = private_nh.advertise<nav_msgs::Path>("plan", 1);
         
        initialized_ = true;
   
        
    } else
        ROS_WARN("This planner has already been initialized, you can't call it twice, doing nothing");

}

  double DockPlanner::distance(const geometry_msgs::Pose& p1, const geometry_msgs::Pose& p2)
  {
    return hypot(p1.position.x - p2.position.x, p1.position.y - p2.position.y);
  }



bool DockPlanner::makePlan(const geometry_msgs::PoseStamped& start, const geometry_msgs::PoseStamped& goal,
                           std::vector<geometry_msgs::PoseStamped>& plan) {

        std::vector<geometry_msgs::PoseStamped> path;
        double vector[2], mag;
        mag = distance(start.pose, goal.pose);
        vector[0] = (goal.pose.position.x - start.pose.position.x) / mag ;
        vector[1] = (goal.pose.position.y - start.pose.position.y) / mag ;
        geometry_msgs::PoseStamped point;
        point.pose = start.pose;
        point.header.frame_id = frame_id_;
        point.header.stamp = ros::Time::now();

        while(distance(point.pose, goal.pose) > 0.01){
            path.push_back(point);
            point.pose.position.x += 0.01 * vector[0];
            point.pose.position.y += 0.01 * vector[1];
            point.header.stamp = ros::Time::now();
            point.pose.orientation.x = 0.0;
            point.pose.orientation.y = 0.0;
            point.pose.orientation.z = 0.0;
            point.pose.orientation.w = 1.0;
        }

    geometry_msgs::PoseStamped Goal;
    Goal = goal;
    Goal.header.stamp = ros::Time::now();
    path.push_back(Goal);
    plan = path;

    //publish the plan for visualization purposes
    publishPlan(path);

    return 1;
}


void DockPlanner::publishPlan(const std::vector<geometry_msgs::PoseStamped>& path) {
    if (!initialized_) {
        ROS_ERROR(
                "This planner has not been initialized yet, but it is being used, please call initialize() before use");
        return;
    }

    //create a message for the plan
    nav_msgs::Path gui_path;
    gui_path.poses.resize(path.size());

    gui_path.header.frame_id = frame_id_;
    gui_path.header.stamp = ros::Time::now();

    // Extract the plan in world co-ordinates, we assume the path is all in the same frame
    for (unsigned int i = 0; i < path.size(); i++) {
        gui_path.poses[i] = path[i];
    }

    plan_pub_.publish(gui_path);
}

} //end namespace roadmap_global_planner


