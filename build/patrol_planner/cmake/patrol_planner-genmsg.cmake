# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "patrol_planner: 3 messages, 10 services")

set(MSG_I_FLAGS "-Ipatrol_planner:/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Ipatrol_planner:/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(patrol_planner_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" "patrol_planner/Milestone"
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" "geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_custom_target(_patrol_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_planner" "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_msg_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_msg_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)

### Generating Services
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)
_generate_srv_cpp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
)

### Generating Module File
_generate_module_cpp(patrol_planner
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(patrol_planner_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(patrol_planner_generate_messages patrol_planner_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_cpp _patrol_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_planner_gencpp)
add_dependencies(patrol_planner_gencpp patrol_planner_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_planner_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_msg_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_msg_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)

### Generating Services
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)
_generate_srv_eus(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
)

### Generating Module File
_generate_module_eus(patrol_planner
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(patrol_planner_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(patrol_planner_generate_messages patrol_planner_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_eus _patrol_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_planner_geneus)
add_dependencies(patrol_planner_geneus patrol_planner_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_planner_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_msg_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_msg_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)

### Generating Services
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)
_generate_srv_lisp(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
)

### Generating Module File
_generate_module_lisp(patrol_planner
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(patrol_planner_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(patrol_planner_generate_messages patrol_planner_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_lisp _patrol_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_planner_genlisp)
add_dependencies(patrol_planner_genlisp patrol_planner_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_planner_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_msg_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_msg_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)

### Generating Services
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)
_generate_srv_nodejs(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
)

### Generating Module File
_generate_module_nodejs(patrol_planner
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(patrol_planner_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(patrol_planner_generate_messages patrol_planner_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_nodejs _patrol_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_planner_gennodejs)
add_dependencies(patrol_planner_gennodejs patrol_planner_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_planner_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_msg_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_msg_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)

### Generating Services
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)
_generate_srv_py(patrol_planner
  "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
)

### Generating Module File
_generate_module_py(patrol_planner
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(patrol_planner_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(patrol_planner_generate_messages patrol_planner_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Save.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GPSGoal.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Park.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/PoseList.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Tabled.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Obstacle.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Tl_gl.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg/Milestone.msg" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/PathLoad.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/GetPlan.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Table.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/patrol_planner/srv/Pause.srv" NAME_WE)
add_dependencies(patrol_planner_generate_messages_py _patrol_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_planner_genpy)
add_dependencies(patrol_planner_genpy patrol_planner_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_planner_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_planner
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(patrol_planner_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(patrol_planner_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET patrol_planner_generate_messages_cpp)
  add_dependencies(patrol_planner_generate_messages_cpp patrol_planner_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/patrol_planner
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(patrol_planner_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(patrol_planner_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET patrol_planner_generate_messages_eus)
  add_dependencies(patrol_planner_generate_messages_eus patrol_planner_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_planner
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(patrol_planner_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(patrol_planner_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET patrol_planner_generate_messages_lisp)
  add_dependencies(patrol_planner_generate_messages_lisp patrol_planner_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/patrol_planner
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(patrol_planner_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(patrol_planner_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET patrol_planner_generate_messages_nodejs)
  add_dependencies(patrol_planner_generate_messages_nodejs patrol_planner_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_planner
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(patrol_planner_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(patrol_planner_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET patrol_planner_generate_messages_py)
  add_dependencies(patrol_planner_generate_messages_py patrol_planner_generate_messages_py)
endif()
