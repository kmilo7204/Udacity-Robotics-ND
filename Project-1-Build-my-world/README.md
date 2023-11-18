# Project 1: Build my world
Create a Gazebo world which includes a custom robot model and a Plugin to print a Welcome message

<img width="682" alt="image" src="https://github.com/huuanhhuynguyen/RoboND-Build-My-World/assets/49252525/26dbd01a-d56a-48cc-b8b6-8fc08dc89565">

## Build
In order to build this project you would need to have installed:
- ROS
- CMAKE
- GCC

To build the script which prints the Welcome message follow the next steps:

1. Create the build folder:
    ```
    mkdir build && cd build
    ```
2. Build the code:
    ```
    cmake ../
    make
    ```
3. Add the build folder to the Gazebo plugin path:
    ```
    GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:$PATH_TO_BUILD_FOLDER
    ```
For example, if running in the workspace `export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/home/workspace/udacity_robot/build`

## Launch the simulation
1. In the Repository project folder, rum the followin command to launch the simulation:
    ```
    gazebo world/Office
    ```