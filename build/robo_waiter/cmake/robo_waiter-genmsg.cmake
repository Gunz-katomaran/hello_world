# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robo_waiter: 2 messages, 5 services")

set(MSG_I_FLAGS "-Irobo_waiter:/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Irobo_waiter:/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robo_waiter_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_custom_target(_robo_waiter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robo_waiter" "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)
_generate_msg_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)

### Generating Services
_generate_srv_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)
_generate_srv_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)
_generate_srv_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)
_generate_srv_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)
_generate_srv_cpp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
)

### Generating Module File
_generate_module_cpp(robo_waiter
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robo_waiter_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robo_waiter_generate_messages robo_waiter_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_cpp _robo_waiter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robo_waiter_gencpp)
add_dependencies(robo_waiter_gencpp robo_waiter_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robo_waiter_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)
_generate_msg_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)

### Generating Services
_generate_srv_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)
_generate_srv_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)
_generate_srv_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)
_generate_srv_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)
_generate_srv_eus(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
)

### Generating Module File
_generate_module_eus(robo_waiter
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robo_waiter_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robo_waiter_generate_messages robo_waiter_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_eus _robo_waiter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robo_waiter_geneus)
add_dependencies(robo_waiter_geneus robo_waiter_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robo_waiter_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)
_generate_msg_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)

### Generating Services
_generate_srv_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)
_generate_srv_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)
_generate_srv_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)
_generate_srv_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)
_generate_srv_lisp(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
)

### Generating Module File
_generate_module_lisp(robo_waiter
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robo_waiter_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robo_waiter_generate_messages robo_waiter_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_lisp _robo_waiter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robo_waiter_genlisp)
add_dependencies(robo_waiter_genlisp robo_waiter_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robo_waiter_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)
_generate_msg_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)

### Generating Services
_generate_srv_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)
_generate_srv_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)
_generate_srv_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)
_generate_srv_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)
_generate_srv_nodejs(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
)

### Generating Module File
_generate_module_nodejs(robo_waiter
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robo_waiter_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robo_waiter_generate_messages robo_waiter_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_nodejs _robo_waiter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robo_waiter_gennodejs)
add_dependencies(robo_waiter_gennodejs robo_waiter_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robo_waiter_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)
_generate_msg_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)

### Generating Services
_generate_srv_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)
_generate_srv_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)
_generate_srv_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)
_generate_srv_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)
_generate_srv_py(robo_waiter
  "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
)

### Generating Module File
_generate_module_py(robo_waiter
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robo_waiter_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robo_waiter_generate_messages robo_waiter_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Obstacle.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Mile.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Pause.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg/Tabled.msg" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Tl_gl.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Park.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robo_waiter/srv/Table.srv" NAME_WE)
add_dependencies(robo_waiter_generate_messages_py _robo_waiter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robo_waiter_genpy)
add_dependencies(robo_waiter_genpy robo_waiter_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robo_waiter_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robo_waiter
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robo_waiter_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robo_waiter_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET robo_waiter_generate_messages_cpp)
  add_dependencies(robo_waiter_generate_messages_cpp robo_waiter_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robo_waiter
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robo_waiter_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robo_waiter_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET robo_waiter_generate_messages_eus)
  add_dependencies(robo_waiter_generate_messages_eus robo_waiter_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robo_waiter
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robo_waiter_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robo_waiter_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET robo_waiter_generate_messages_lisp)
  add_dependencies(robo_waiter_generate_messages_lisp robo_waiter_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robo_waiter
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robo_waiter_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robo_waiter_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET robo_waiter_generate_messages_nodejs)
  add_dependencies(robo_waiter_generate_messages_nodejs robo_waiter_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robo_waiter
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robo_waiter_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robo_waiter_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET robo_waiter_generate_messages_py)
  add_dependencies(robo_waiter_generate_messages_py robo_waiter_generate_messages_py)
endif()
