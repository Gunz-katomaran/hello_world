# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "path_planner: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Iroadmap_global_planner_msgs:/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(path_planner_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_custom_target(_path_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_planner" "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_custom_target(_path_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_planner" "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_custom_target(_path_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_planner" "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_custom_target(_path_planner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_planner" "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" "roadmap_global_planner_msgs/AdjacencyList:roadmap_global_planner_msgs/MapPair:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:roadmap_global_planner_msgs/PointList"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
)
_generate_srv_cpp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
)
_generate_srv_cpp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
)
_generate_srv_cpp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/AdjacencyList.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/MapPair.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/PointList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
)

### Generating Module File
_generate_module_cpp(path_planner
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(path_planner_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(path_planner_generate_messages path_planner_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_cpp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_cpp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_cpp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_cpp _path_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_planner_gencpp)
add_dependencies(path_planner_gencpp path_planner_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_planner_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
)
_generate_srv_eus(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
)
_generate_srv_eus(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
)
_generate_srv_eus(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/AdjacencyList.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/MapPair.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/PointList.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
)

### Generating Module File
_generate_module_eus(path_planner
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(path_planner_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(path_planner_generate_messages path_planner_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_eus _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_eus _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_eus _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_eus _path_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_planner_geneus)
add_dependencies(path_planner_geneus path_planner_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_planner_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
)
_generate_srv_lisp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
)
_generate_srv_lisp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
)
_generate_srv_lisp(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/AdjacencyList.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/MapPair.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/PointList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
)

### Generating Module File
_generate_module_lisp(path_planner
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(path_planner_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(path_planner_generate_messages path_planner_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_lisp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_lisp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_lisp _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_lisp _path_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_planner_genlisp)
add_dependencies(path_planner_genlisp path_planner_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_planner_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
)
_generate_srv_nodejs(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
)
_generate_srv_nodejs(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
)
_generate_srv_nodejs(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/AdjacencyList.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/MapPair.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/PointList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
)

### Generating Module File
_generate_module_nodejs(path_planner
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(path_planner_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(path_planner_generate_messages path_planner_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_nodejs _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_nodejs _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_nodejs _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_nodejs _path_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_planner_gennodejs)
add_dependencies(path_planner_gennodejs path_planner_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_planner_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
)
_generate_srv_py(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
)
_generate_srv_py(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
)
_generate_srv_py(path_planner
  "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/AdjacencyList.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/MapPair.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg/PointList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
)

### Generating Module File
_generate_module_py(path_planner
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(path_planner_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(path_planner_generate_messages path_planner_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/PathFinder.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_py _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Manager.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_py _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Goal.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_py _path_planner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_planner/srv/Graph.srv" NAME_WE)
add_dependencies(path_planner_generate_messages_py _path_planner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_planner_genpy)
add_dependencies(path_planner_genpy path_planner_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_planner_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_planner
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(path_planner_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(path_planner_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET roadmap_global_planner_msgs_generate_messages_cpp)
  add_dependencies(path_planner_generate_messages_cpp roadmap_global_planner_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_planner
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(path_planner_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(path_planner_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET roadmap_global_planner_msgs_generate_messages_eus)
  add_dependencies(path_planner_generate_messages_eus roadmap_global_planner_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_planner
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(path_planner_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(path_planner_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET roadmap_global_planner_msgs_generate_messages_lisp)
  add_dependencies(path_planner_generate_messages_lisp roadmap_global_planner_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_planner
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(path_planner_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(path_planner_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET roadmap_global_planner_msgs_generate_messages_nodejs)
  add_dependencies(path_planner_generate_messages_nodejs roadmap_global_planner_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_planner
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(path_planner_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(path_planner_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET roadmap_global_planner_msgs_generate_messages_py)
  add_dependencies(path_planner_generate_messages_py roadmap_global_planner_msgs_generate_messages_py)
endif()
