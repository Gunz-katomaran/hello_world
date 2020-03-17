cmake_minimum_required(VERSION 2.8.3)
project(path_follower)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED
message_generation
std_msgs
geometry_msgs
)

find_package(catkin REQUIRED
COMPONENTS
std_msgs
pluginlib
nav_core 
navfn 
nav_msgs  
roscpp
geometry_msgs
std_msgs
message_generation
)
add_message_files(
  FILES
  PoseList.msg
  PointList.msg
 )
add_service_files(
  FILES
  PointLoad.srv
  GoalLoad.srv
  Nearest.srv
)
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  path_follower
)
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES path_planner
  CATKIN_DEPENDS
     pluginlib
     nav_core
     navfn
     nav_msgs
     roscpp
     geometry_msgs
     std_msgs
     message_runtime
)

include_directories(
 include
 ${catkin_INCLUDE_DIRS}
)

add_library(path_follower_lib src/path_follower.cpp)

install(FILES path_follower_plugin.xml
DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(DIRECTORY include
DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
PATTERN "*~" EXCLUDE
)

