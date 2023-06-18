# Use Ubuntu 20.04 as the base image
FROM nvidia/cudagl:11.4.0-base-ubuntu20.04
# FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install essential packages
RUN apt-get update && apt-get install -y \
    gnupg2 \
    lsb-release \
    curl \
    git \
    sudo \
    cmake

# Setup ROS Noetic sources.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Add ROS repository key
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Install ROS Noetic
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full

# Setup ROS environment variables
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Install Gazebo and dependencies
RUN apt-get update && apt-get install -y \
    libgazebo9 \
    gazebo9-common \
    gazebo9-plugin-base \
    gazebo9 \
    libgazebo9-dev \
    && apt-get install -y --fix-broken

# Create a catkin workspace
RUN mkdir -p /catkin_ws/src

# Set the working directory to the catkin workspace
WORKDIR /catkin_ws

# Build the catkin workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    catkin_make"

# Source the catkin workspace
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]


# docker run -it --privileged --name ros-gazebo:20.04 --env="DISPLAY" --net=host
# docker run -it --privileged --env="DISPLAY" --net=host -v /home/ekumen/Camilo_Repos/Udacity-Robotics-ND/Project-1-Build-my-world:/catkin_ws/src ros-gazebo:20.04

# docker run -it --privileged --env="DISPLAY" --net=host -v /home/ekumen/Camilo_Repos/Udacity-Robotics-ND/Project-1-Build-my-world:. ros-gazebo:20.04
