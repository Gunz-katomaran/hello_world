# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_base_servo: 0 messages, 2 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_base_servo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_custom_target(_robot_base_servo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_base_servo" "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" ""
)

get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_custom_target(_robot_base_servo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_base_servo" "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_base_servo
)
_generate_srv_cpp(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_base_servo
)

### Generating Module File
_generate_module_cpp(robot_base_servo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_base_servo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_base_servo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_base_servo_generate_messages robot_base_servo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_cpp _robot_base_servo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_cpp _robot_base_servo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_base_servo_gencpp)
add_dependencies(robot_base_servo_gencpp robot_base_servo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_base_servo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_base_servo
)
_generate_srv_eus(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_base_servo
)

### Generating Module File
_generate_module_eus(robot_base_servo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_base_servo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_base_servo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_base_servo_generate_messages robot_base_servo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_eus _robot_base_servo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_eus _robot_base_servo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_base_servo_geneus)
add_dependencies(robot_base_servo_geneus robot_base_servo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_base_servo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_base_servo
)
_generate_srv_lisp(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_base_servo
)

### Generating Module File
_generate_module_lisp(robot_base_servo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_base_servo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_base_servo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_base_servo_generate_messages robot_base_servo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_lisp _robot_base_servo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_lisp _robot_base_servo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_base_servo_genlisp)
add_dependencies(robot_base_servo_genlisp robot_base_servo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_base_servo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_base_servo
)
_generate_srv_nodejs(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_base_servo
)

### Generating Module File
_generate_module_nodejs(robot_base_servo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_base_servo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_base_servo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_base_servo_generate_messages robot_base_servo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_nodejs _robot_base_servo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_nodejs _robot_base_servo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_base_servo_gennodejs)
add_dependencies(robot_base_servo_gennodejs robot_base_servo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_base_servo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo
)
_generate_srv_py(robot_base_servo
  "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo
)

### Generating Module File
_generate_module_py(robot_base_servo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_base_servo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_base_servo_generate_messages robot_base_servo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/speed.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_py _robot_base_servo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/katomaran-ros/catkin_ws8/src/robot_base_servo/srv/voltage.srv" NAME_WE)
add_dependencies(robot_base_servo_generate_messages_py _robot_base_servo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_base_servo_genpy)
add_dependencies(robot_base_servo_genpy robot_base_servo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_base_servo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_base_servo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_base_servo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET robot_base_servo_generate_messages_cpp)
  add_dependencies(robot_base_servo_generate_messages_cpp robot_base_servo_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_base_servo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_base_servo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET robot_base_servo_generate_messages_eus)
  add_dependencies(robot_base_servo_generate_messages_eus robot_base_servo_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_base_servo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_base_servo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET robot_base_servo_generate_messages_lisp)
  add_dependencies(robot_base_servo_generate_messages_lisp robot_base_servo_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_base_servo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_base_servo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET robot_base_servo_generate_messages_nodejs)
  add_dependencies(robot_base_servo_generate_messages_nodejs robot_base_servo_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_base_servo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET robot_base_servo_generate_messages_py)
  add_dependencies(robot_base_servo_generate_messages_py robot_base_servo_generate_messages_py)
endif()
