# Localization project
For this project we need:
  - Robot: URDF and Gazebo file that describes a differential robot.
  - World: Gazebo world that will host the environment and our robot.
  - Map: Map of the world.
  - AMCL package: To perform SLAM and localize.

To create the map, the PNG map creator package is avaiable;

## Workspace
## Build
```
  catkin_make
```

Source the workspace
```
  source devel/setup.bash
```

## Launch
Launch the robot
```
  roslaunch diff_robot world.launch
```

Launch AMCL
```
  roslaunch diff_robot amcl.launch
```

Launch Teleop keyboard
```
  rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

## Results

./run.sh ~/Camilo_Repos/Udacity-Robotics-ND/Project-3/catkin_ws/src/ catkin ros-gazebo-nvidia:20.04
