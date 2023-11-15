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
    ros-kinetic-navigation \
    ros-kinetic-map-server \
    ros-kinetic-move-base \
    ros-kinetic-amcl \
    ros-kinetic-openslam-gmapping \
    ros-kinetic-map-server \
    ros-kinetic-move-base \
    ros-kinetic-navigation \
    ros-kinetic-gazebo-ros-control \
    ros-kinetic-joint-state-publisher \
    ros-kinetic-joint-state-controller \
    ros-kinetic-effort-controllers \
    ros-kinetic-velocity-controllers \
    ros-kinetic-openslam-gmapping \
    ros-kinetic-joy \
    ros-kinetic-joy* \
    ros-kinetic-yocs-* \
    ros-kinetic-kobuki* \
    ros-kinetic-depthimage-to-laserscan \
    ros-kinetic-turtlebot-navigation \
    ros-kinetic-openni2-launch \
    ros-kinetic-urg-node \
    && apt-get install -y --fix-broken

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]

# docker build -t ros-gazebo:16.04 .

# docker run -it --privileged --name ros-gazebo:20.04 --env="DISPLAY" --net=host
# docker run -it --privileged --env="DISPLAY" --net=host -v /home/ekumen/Camilo_Repos/Udacity-Robotics-ND/catkin_ws/src:/catkin_ws/src ros-gazebo:18.04

# Use this
# docker run -it \
#     --privileged \
#     --gpus "all" \
#     --env="DISPLAY" \
#     --env="QT_X11_NO_MITSHM=1" \
#     --env="XAUTHORITY=/tmp/.docker.xauth" \
#     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#     --volume="/tmp/.docker.xauth:/tmp/.docker.xauth:rw" \
#     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#     --net=host \
#     -v /home/ekumen/Camilo_Repos/Udacity-Robotics-ND/catkin_ws/src:/catkin_ws/src\
#     ros-gazebo:16.04


# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64

# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb


# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654


# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub

# curl -k 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub' | apt-key add -
# sudo apt upgrade libignition-math2a
