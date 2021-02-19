# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ivr_assignment: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iivr_assignment:/media/sf_cw/catkin_ws/src/ivr_assignment/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ivr_assignment_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" ""
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" "std_msgs/Header:ivr_assignment/Angles"
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" ""
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" "ivr_assignment/Point:std_msgs/Header"
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" "ivr_assignment/Point"
)

get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_custom_target(_ivr_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ivr_assignment" "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" "ivr_assignment/State:ivr_assignment/Point:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_cpp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
)

### Generating Services

### Generating Module File
_generate_module_cpp(ivr_assignment
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ivr_assignment_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ivr_assignment_generate_messages ivr_assignment_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_cpp _ivr_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ivr_assignment_gencpp)
add_dependencies(ivr_assignment_gencpp ivr_assignment_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ivr_assignment_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)
_generate_msg_eus(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
)

### Generating Services

### Generating Module File
_generate_module_eus(ivr_assignment
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ivr_assignment_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ivr_assignment_generate_messages ivr_assignment_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_eus _ivr_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ivr_assignment_geneus)
add_dependencies(ivr_assignment_geneus ivr_assignment_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ivr_assignment_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)
_generate_msg_lisp(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
)

### Generating Services

### Generating Module File
_generate_module_lisp(ivr_assignment
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ivr_assignment_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ivr_assignment_generate_messages ivr_assignment_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_lisp _ivr_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ivr_assignment_genlisp)
add_dependencies(ivr_assignment_genlisp ivr_assignment_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ivr_assignment_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)
_generate_msg_nodejs(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ivr_assignment
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ivr_assignment_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ivr_assignment_generate_messages ivr_assignment_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_nodejs _ivr_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ivr_assignment_gennodejs)
add_dependencies(ivr_assignment_gennodejs ivr_assignment_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ivr_assignment_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)
_generate_msg_py(ivr_assignment
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg"
  "${MSG_I_FLAGS}"
  "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg;/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
)

### Generating Services

### Generating Module File
_generate_module_py(ivr_assignment
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ivr_assignment_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ivr_assignment_generate_messages ivr_assignment_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Angles.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/AnglesStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/FloatStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/Point.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/PointStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/State.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/sf_cw/catkin_ws/src/ivr_assignment/msg/StateStamped.msg" NAME_WE)
add_dependencies(ivr_assignment_generate_messages_py _ivr_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ivr_assignment_genpy)
add_dependencies(ivr_assignment_genpy ivr_assignment_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ivr_assignment_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ivr_assignment
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ivr_assignment_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ivr_assignment
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ivr_assignment_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ivr_assignment
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ivr_assignment_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ivr_assignment
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ivr_assignment_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ivr_assignment/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ivr_assignment_generate_messages_py std_msgs_generate_messages_py)
endif()
