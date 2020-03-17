cmake_minimum_required(VERSION 2.8.3)
project(path_planner)
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
roadmap_global_planner_msgs
)

add_service_files(
  FILES
  PathFinder.srv
  Graph.srv
  Goal.srv
  Manager.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  roadmap_global_planner_msgs
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


add_library(path_planner_lib src/path_planner.cpp
src/orientation_filler.cpp)

install(FILES path_planner_plugin.xml
DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(DIRECTORY include
DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
PATTERN "*~" EXCLUDE
)
