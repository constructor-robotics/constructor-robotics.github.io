---
layout: default
title: Docker
parent: Linux and ROS Overview
nav_order: 3
---

# Docker usage

Instead of installing every peace of software 1 by 1, we decided to take a dockers-approach.
The setup is done on Mac, but on Linux machines everything should be easier, and work as well.
The only difficult part is the display part, which maybe on linux needs a change in the docker-compose.yml
To display e.g. a GUI in docker on Mac, you need to use [XQuartz](https://www.xquartz.org).

The idea is, that a devcontainer is used for the ROS2 setup together with its packages that are imporant.
the workspace github is:
``` git@github.com:constructor-robotics/bluerovws.git```

Additionally, this is designed to work with CLion devcontainer. Not designed for VSCode. But could ofc. also work if done right.

Steps to do:
1. download the packages in src. to be compiled. there exists a bash file for it in ```bluerovws```, which downloads the most essential ones. the folders are not part of this git repository. Therefore, they need to be updated independently, if you want to push your changes there.
2. Launch devcontainer.
3. Compile the ros2 ws in ~/ros_ws
4. Run bluerov gui to test if display works.









