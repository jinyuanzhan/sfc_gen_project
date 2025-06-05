# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vicon_env: 8 messages, 0 services")

set(MSG_I_FLAGS "-Ivicon_env:/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vicon_env_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" ""
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" ""
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" "vicon_env/Point2d"
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" "vicon_env/Point2d"
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" "vicon_env/Point2d"
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" "vicon_env/Point3d:vicon_env/Point2d"
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" "vicon_env/Point3d:vicon_env/Point2d"
)

get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_custom_target(_vicon_env_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_env" "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" "std_msgs/Header:vicon_env/Cylinder:vicon_env/Circle:vicon_env/Point3d:vicon_env/Polygon:vicon_env/Polyhedron:vicon_env/Ellipse:vicon_env/Point2d"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)
_generate_msg_cpp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
)

### Generating Services

### Generating Module File
_generate_module_cpp(vicon_env
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vicon_env_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vicon_env_generate_messages vicon_env_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_cpp _vicon_env_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_env_gencpp)
add_dependencies(vicon_env_gencpp vicon_env_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_env_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)
_generate_msg_eus(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
)

### Generating Services

### Generating Module File
_generate_module_eus(vicon_env
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vicon_env_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vicon_env_generate_messages vicon_env_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_eus _vicon_env_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_env_geneus)
add_dependencies(vicon_env_geneus vicon_env_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_env_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)
_generate_msg_lisp(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
)

### Generating Services

### Generating Module File
_generate_module_lisp(vicon_env
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vicon_env_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vicon_env_generate_messages vicon_env_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_lisp _vicon_env_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_env_genlisp)
add_dependencies(vicon_env_genlisp vicon_env_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_env_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)
_generate_msg_nodejs(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
)

### Generating Services

### Generating Module File
_generate_module_nodejs(vicon_env
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vicon_env_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vicon_env_generate_messages vicon_env_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_nodejs _vicon_env_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_env_gennodejs)
add_dependencies(vicon_env_gennodejs vicon_env_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_env_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg"
  "${MSG_I_FLAGS}"
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)
_generate_msg_py(vicon_env
  "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg;/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
)

### Generating Services

### Generating Module File
_generate_module_py(vicon_env
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vicon_env_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vicon_env_generate_messages vicon_env_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point2d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Point3d.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Ellipse.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Circle.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polygon.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Cylinder.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/Polyhedron.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jinyuan/project_sfc/src/kr_param_map/vicon_env/msg/SemanticArray.msg" NAME_WE)
add_dependencies(vicon_env_generate_messages_py _vicon_env_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_env_genpy)
add_dependencies(vicon_env_genpy vicon_env_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_env_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_env
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(vicon_env_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_env
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(vicon_env_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_env
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(vicon_env_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_env
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(vicon_env_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_env
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(vicon_env_generate_messages_py std_msgs_generate_messages_py)
endif()
