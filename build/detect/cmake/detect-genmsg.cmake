# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "detect: 2 messages, 0 services")

set(MSG_I_FLAGS "-Idetect:/home/jbl/projects/arm/src/detect/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(detect_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_custom_target(_detect_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detect" "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" ""
)

get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_custom_target(_detect_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detect" "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(detect
  "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detect
)
_generate_msg_cpp(detect
  "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detect
)

### Generating Services

### Generating Module File
_generate_module_cpp(detect
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detect
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(detect_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(detect_generate_messages detect_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_cpp _detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_cpp _detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detect_gencpp)
add_dependencies(detect_gencpp detect_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detect_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(detect
  "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detect
)
_generate_msg_eus(detect
  "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detect
)

### Generating Services

### Generating Module File
_generate_module_eus(detect
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detect
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(detect_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(detect_generate_messages detect_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_eus _detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_eus _detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detect_geneus)
add_dependencies(detect_geneus detect_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detect_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(detect
  "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detect
)
_generate_msg_lisp(detect
  "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detect
)

### Generating Services

### Generating Module File
_generate_module_lisp(detect
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detect
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(detect_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(detect_generate_messages detect_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_lisp _detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_lisp _detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detect_genlisp)
add_dependencies(detect_genlisp detect_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detect_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(detect
  "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detect
)
_generate_msg_nodejs(detect
  "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detect
)

### Generating Services

### Generating Module File
_generate_module_nodejs(detect
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detect
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(detect_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(detect_generate_messages detect_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_nodejs _detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_nodejs _detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detect_gennodejs)
add_dependencies(detect_gennodejs detect_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detect_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(detect
  "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect
)
_generate_msg_py(detect
  "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect
)

### Generating Services

### Generating Module File
_generate_module_py(detect
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(detect_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(detect_generate_messages detect_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/EntityInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_py _detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jbl/projects/arm/src/detect/msg/MovementInformation.msg" NAME_WE)
add_dependencies(detect_generate_messages_py _detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detect_genpy)
add_dependencies(detect_genpy detect_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detect_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detect
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(detect_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detect
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(detect_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detect
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(detect_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detect
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(detect_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detect
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(detect_generate_messages_py std_msgs_generate_messages_py)
endif()
