# Where I am
The main purpose of this project is to create a simulation with our differential robot and Monte Carlo localization, to perform localization within the Office world.

In order to complete this project we need:
  - Robot: URDF and Gazebo file that describes a differential robot.
  - World: Gazebo world that will host the environment and our robot.
  - Map: Map of the world.
  - AMCL package: To perform SLAM and localize.

Please remember that you can create the map by using PNG map creator package.

## Container
A container is provided as well as a batch script you can use to run it, for that use:
  ```
    ./run.sh ~/Camilo_Repos/Udacity-Robotics-ND/Project-3/catkin_ws/src/ catkin ros-gazebo-nvidia:20.04
  ```

## Workspace
In order to build the workspace and launch the simulation, follow the next steps:

## Build
- Move into the catkin workspace under `/home` folder and build the code with:
  ```
    catkin_make
  ```

Once build is completed, source the workspace in each new terminal before launching any element of the simulation:
  ```
    source devel/setup.bash
  ```

## Launch
- Launch the robot
  ```
    oslaunch diff_robot world.launch
  ```

- Launch AMCL
  ```
    roslaunch diff_robot amcl.launch
  ```

- Launch Teleop keyboard
  ```
    rosrun teleop_twist_keyboard teleop_twist_keyboard.py
  ```

## Resultps
- Simulation launch


- Robot localized


