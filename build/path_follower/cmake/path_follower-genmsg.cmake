# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "path_follower: 2 messages, 3 services")

set(MSG_I_FLAGS "-Ipath_follower:/home/katomaran-ros/catkin_ws8/src/path_follower/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Ipath_follower:/home/katomaran-ros/catkin_ws8/src/path_follower/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(path_follower_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_custom_target(_path_follower_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_follower" "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" "path_follower/PointList:path_follower/PoseList"
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_custom_target(_path_follower_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_follower" "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_custom_target(_path_follower_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_follower" "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" "path_follower/PoseList"
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_custom_target(_path_follower_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_follower" "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_custom_target(_path_follower_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_follower" "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
)
_generate_msg_cpp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
)

### Generating Services
_generate_srv_cpp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg;/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
)
_generate_srv_cpp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
)
_generate_srv_cpp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
)

### Generating Module File
_generate_module_cpp(path_follower
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(path_follower_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(path_follower_generate_messages path_follower_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_cpp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_cpp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_cpp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_cpp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_cpp _path_follower_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_follower_gencpp)
add_dependencies(path_follower_gencpp path_follower_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_follower_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
)
_generate_msg_eus(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
)

### Generating Services
_generate_srv_eus(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg;/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
)
_generate_srv_eus(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
)
_generate_srv_eus(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
)

### Generating Module File
_generate_module_eus(path_follower
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(path_follower_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(path_follower_generate_messages path_follower_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_eus _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_eus _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_eus _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_eus _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_eus _path_follower_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_follower_geneus)
add_dependencies(path_follower_geneus path_follower_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_follower_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
)
_generate_msg_lisp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
)

### Generating Services
_generate_srv_lisp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg;/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
)
_generate_srv_lisp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
)
_generate_srv_lisp(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
)

### Generating Module File
_generate_module_lisp(path_follower
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(path_follower_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(path_follower_generate_messages path_follower_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_lisp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_lisp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_lisp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_lisp _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_lisp _path_follower_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_follower_genlisp)
add_dependencies(path_follower_genlisp path_follower_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_follower_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
)
_generate_msg_nodejs(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
)

### Generating Services
_generate_srv_nodejs(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg;/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
)
_generate_srv_nodejs(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
)
_generate_srv_nodejs(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
)

### Generating Module File
_generate_module_nodejs(path_follower
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(path_follower_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(path_follower_generate_messages path_follower_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_nodejs _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_nodejs _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_nodejs _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_nodejs _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_nodejs _path_follower_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_follower_gennodejs)
add_dependencies(path_follower_gennodejs path_follower_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_follower_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
)
_generate_msg_py(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
)

### Generating Services
_generate_srv_py(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv"
  "${MSG_I_FLAGS}"
  "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg;/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
)
_generate_srv_py(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
)
_generate_srv_py(path_follower
  "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
)

### Generating Module File
_generate_module_py(path_follower
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(path_follower_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(path_follower_generate_messages path_follower_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/PointLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_py _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PoseList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_py _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/msg/PointList.msg" NAME_WE)
add_dependencies(path_follower_generate_messages_py _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/GoalLoad.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_py _path_follower_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/path_follower/srv/Nearest.srv" NAME_WE)
add_dependencies(path_follower_generate_messages_py _path_follower_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_follower_genpy)
add_dependencies(path_follower_genpy path_follower_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_follower_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_follower
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(path_follower_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(path_follower_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET path_follower_generate_messages_cpp)
  add_dependencies(path_follower_generate_messages_cpp path_follower_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_follower
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(path_follower_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(path_follower_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET path_follower_generate_messages_eus)
  add_dependencies(path_follower_generate_messages_eus path_follower_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_follower
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(path_follower_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(path_follower_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET path_follower_generate_messages_lisp)
  add_dependencies(path_follower_generate_messages_lisp path_follower_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_follower
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(path_follower_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(path_follower_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET path_follower_generate_messages_nodejs)
  add_dependencies(path_follower_generate_messages_nodejs path_follower_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_follower
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(path_follower_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(path_follower_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET path_follower_generate_messages_py)
  add_dependencies(path_follower_generate_messages_py path_follower_generate_messages_py)
endif()
