---
layout: default
title: Camera Settings
parent: Sensors Overview
nav_order: 7
---

# Camera setup Raspberry pi on BlueAUV

We use this [Camera driver](https://github.com/christianrauch/camera_ros)
After installing, the camera connected can be run with this command:
`ros2 run camera_ros camera_node --ros-args -p camera:=0 -p width:=1280 -p height:=1024`


