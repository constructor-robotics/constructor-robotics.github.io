---
layout: default
title: Installation ROS2 Overview
parent: Linux and ROS Overview
nav_order: 1
---

Quick ways to install ROS2 on Ubuntu 24.04:

```
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" # If using Ubuntu derivates use $UBUNTU_CODENAME
sudo apt install /tmp/ros2-apt-source.deb
sudo apt update && sudo apt install ros-dev-tools
sudo apt update
sudo apt upgrade
sudo apt install ros-jazzy-ros-base
```


# Bash Setup:
This should be saved into the ~/.bashrc for the ROS setup.


```
source /opt/ros/jazzy/setup.bash
source ~/ros_ws/install/local_setup.bash
export ROS_DOMAIN_ID=161
```





