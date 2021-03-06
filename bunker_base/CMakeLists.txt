cmake_minimum_required(VERSION 2.8.3)
project(bunker_base)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

# cmake module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(catkin REQUIRED COMPONENTS    
    roslaunch 
    roslint 
    roscpp 
    sensor_msgs
    std_msgs
    geometry_msgs
    bunker_msgs
    wrp_sdk
    tf2 
    tf2_ros
)
    
# find_package(Boost REQUIRED COMPONENTS chrono)

###################################
## catkin specific configuration ##
###################################

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES bunker_messenger
  CATKIN_DEPENDS bunker_msgs roscpp sensor_msgs
#   DEPENDS Boost
)

###########
## Build ##bunkermsgs
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

add_library(bunker_messenger STATIC src/bunker_messenger.cpp)
target_link_libraries(bunker_messenger ${catkin_LIBRARIES})
set_property(TARGET bunker_messenger PROPERTY POSITION_INDEPENDENT_CODE ON)

add_executable(bunker_base_node src/bunker_base_node.cpp)
target_link_libraries(bunker_base_node bunker_messenger ${catkin_LIBRARIES})

#add_executable(bunker_base_sim_node src/bunker_base_sim_node.cpp)
#target_link_libraries(bunker_base_sim_node bunker_messenger ${catkin_LIBRARIES})



#############
## Install ##
#############

roslaunch_add_file_check(launch)

install(TARGETS bunker_messenger bunker_base_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION})

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})

install(DIRECTORY launch urdf
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
