# Use Ubuntu 20.04 as the base image
FROM nvidia/cudagl:11.3.0-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    git \
    gnupg2 \
    lsb-release \
    sudo \
    wget \
    xterm

# Set up the ROS keys
RUN curl -sSL http://packages.ros.org/ros.key | apt-key add -
# Add the ROS Noetic repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Install ROS Noetic
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full

# Setup ROS environment variables
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

# Create a catkin workspace
RUN mkdir -p /catkin_ws/src

# Set the working directory to the catkin workspace
WORKDIR /home

RUN apt-get update && apt-get install -y \
    ros-noetic-navigation \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-amcl \
    ros-noetic-openslam-gmapping \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-navigation \
    ros-noetic-gazebo-ros-control \
    ros-noetic-joint-state-publisher \
    ros-noetic-joint-state-controller \
    ros-noetic-effort-controllers \
    ros-noetic-velocity-controllers \
    ros-noetic-openslam-gmapping \
    ros-noetic-depthimage-to-laserscan \
    && apt-get install -y --fix-broken

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]

# ros-noetic-openni2-launch \
# ros-noetic-urg-node \
# ros-kinetic-joy \
# ros-kinetic-joy* \
# ros-kinetic-yocs-* \
# ros-kinetic-kobuki* \
# ros-noetic-turtlebot-navigation \