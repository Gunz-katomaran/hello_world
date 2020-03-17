execute_process(COMMAND "/home/katomaran-ros/catkin_ws8/build/swri_rospy/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/katomaran-ros/catkin_ws8/build/swri_rospy/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
