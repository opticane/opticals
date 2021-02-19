# Install script for directory: /media/sf_cw/catkin_ws/src/ivr_assignment

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/sf_cw/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ivr_assignment/msg" TYPE FILE FILES
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
    "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ivr_assignment/cmake" TYPE FILE FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/ivr_assignment-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/include/ivr_assignment")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/share/roseus/ros/ivr_assignment")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/share/common-lisp/ros/ivr_assignment")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/share/gennodejs/ros/ivr_assignment")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/sf_cw/catkin_ws/devel/lib/python3/dist-packages/ivr_assignment")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/lib/python3/dist-packages/ivr_assignment" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/sf_cw/catkin_ws/devel/lib/python3/dist-packages/ivr_assignment" FILES_MATCHING REGEX "/media/sf_cw/catkin_ws/devel/lib/python3/dist-packages/ivr_assignment/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/ivr_assignment.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ivr_assignment/cmake" TYPE FILE FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/ivr_assignment-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ivr_assignment/cmake" TYPE FILE FILES
    "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/ivr_assignmentConfig.cmake"
    "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/ivr_assignmentConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ivr_assignment" TYPE FILE FILES "/media/sf_cw/catkin_ws/src/ivr_assignment/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/fusion.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/image1_processor.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/image2_processor.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/joint_angles.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/joint_controller.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/save_image.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/target_move.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/fk.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ivr_assignment" TYPE PROGRAM FILES "/media/sf_cw/catkin_ws/build/ivr_assignment/catkin_generated/installspace/angles.py")
endif()

