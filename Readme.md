# ROS Packages for Bunker Mobile Base

## Packages

* bunker_base: a ROS wrapper around bunker SDK to monitor and control the robot
* bunker_bringup: launch and configuration files to start ROS nodes
* bunker_msgs: bunker related message definitions

## Communication interface setup

Please refer to the [README](https://github.com/agilexrobotics/agx_sdk#hardware-interface) of "agx_sdk" package for setup of communication interfaces.

#### Note on CAN interface on Nvidia Jetson Platforms

Nvidia Jeston TX2/Xavier/XavierNX have CAN controller(s) integrated in the main SOC. If you're using a dev kit, you need to add a CAN transceiver for proper CAN communication.

## Basic usage of the ROS package

1. Install dependent packages

    ```
    $ sudo apt install ros-$ROS_DISTRO-teleop-twist-keyboard
    $ sudo apt install ros-$ROS_DISTRO-joint-state-publisher-gui
    $ sudo apt install ros-$ROS_DISTRO-ros-controllers
    $ sudo apt install ros-$ROS_DISTRO-webots-ros
    ```
    ```
    $ sudo apt install libasio-dev
    ```

2. Clone the packages into your catkin workspace and compile

    (the following instructions assume your catkin workspace is at: ~/catkin_ws/src)

    ```
    $ cd ~/catkin_ws/src
    $ git clone --depth 1 https://github.com/agilexrobotics/agx_sdk.git
    $ git clone --depth 1 https://github.com/agilexrobotics/bunker_ros.git
    $ cd ..
    $ catkin_make
    ```

3. Setup CAN-To-USB adapter
* first time use bunker-ros package
    ```
    $rosrun bunker_bringup setup_can2usb.bash
    ```
* If not the first time use bunker-ros package(Run this command every time you turn off the power)
    ```
    $rosrun bunker_bringup bringup_can2usb.bash
    ```
* Testing command
    ```
    # receiving data from can0
    $ candump can0
    # send data to can0
    $ cansend can0 001#1122334455667788
    ```
4. Launch ROS nodes

* Start the base node for the real robot

    ```
    $ roslaunch bunker_bringup bunker_robot_base.launch
    ```

* Start the keyboard tele-op node

    ```
    $ roslaunch bunker_bringup bunker_teleop_keyboard.launch
    ```


**SAFETY PRECAUSION**:

Always have your remote controller ready to take over the control whenever necessary.
