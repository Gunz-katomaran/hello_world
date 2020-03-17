cmake_minimum_required(VERSION 2.8.3)
project(patrol_planner)

find_package(catkin REQUIRED
message_generation
std_msgs
geometry_msgs
)

find_package(catkin REQUIRED
COMPONENTS
std_msgs
message_generation
geometry_msgs
pluginlib
nav_core 
navfn 
nav_msgs  
roscpp
)


add_message_files(
   FILES
   PoseList.msg
   Milestone.msg
   Tabled.msg
)


add_service_files(
   FILES
   Save.srv
   GetPlan.srv
   GPSGoal.srv
   PathLoad.srv
   Table.srv
   Tl_gl.srv
   Pause.srv
   Table.srv
   Park.srv
   Obstacle.srv
)

## Generate actions in the 'action' folder
#add_action_files(
#   FILES
#)

generate_messages(
   DEPENDENCIES
   std_msgs
   geometry_msgs
   patrol_planner
)

catkin_package(
 INCLUDE_DIRS include
 LIBRARIES patrol_planner
 CATKIN_DEPENDS
   geometry_msgs
   pluginlib
   nav_core
   navfn
   nav_msgs
   roscpp
   std_msgs
   message_runtime
)

include_directories(
 include
 ${catkin_INCLUDE_DIRS}
)

add_library(patrol_planner_lib src/patrol_planner.cpp)

install(FILES patrol_planner_plugin.xml
DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(DIRECTORY include
DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
PATTERN "*~" EXCLUDE
)
