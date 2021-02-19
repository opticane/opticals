execute_process(COMMAND "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
