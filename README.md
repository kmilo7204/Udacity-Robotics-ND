# Udacity Robotics Nanodegree

## Build
Build the container with the following command:

  ```
  docker build -t ros-gazebo-nvidia:20.04 .
  ```

## Launch
Launch the container with the following usage of the provided script `run.sh`. The script contains two options to launch projects that required a `catkin_ws` and for projects that does not require it.

- Launch a project without a `catkin_ws`:
  ```
    ./run.sh ${PATH_TO_REPO}/gazebo_workshop/Project_1-Building/ cmake ros-gazebo-nvidia:20.04
  ```

- Launch a project with a `catkin_ws`:
  ```
    ./run.sh ${PATH_TO_REPO}/gazebo_workshop/Project_2-Plugin/ catkin ros-gazebo-nvidia:20.04
  ```
