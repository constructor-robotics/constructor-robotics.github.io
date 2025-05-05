---
layout: default
title: PX4 Software
parent: PX4 and Pixhawk
nav_order: 2
---


# PX4 install and flash of software

Currently we work with 1.14. 1.15 has new updates to the ROS2 interface with its own client. Which is not implemented yet.
The software can be downloaded with 
`git clone -b release/1.14 https://github.com/PX4/PX4-Autopilot.git --recursive`
This has to be fully tested in a docker container
The modification of the PX4 software is located in bluerov2common ROS2 package (`git@github.com:constructor-robotics/bluerov2common.git`)




# PX4 Commands

Show all Topics: `uorb top`
Print special Topic `listener <TOPIC>`
Baro: `ms5611 status` or `ms5611 start/stop -X` -X/-S external und -I/-s Internal



# Raspberry pi Settings for PX4 things

`MicroXRCEAgent serial --dev /dev/ttyACM0 -b 921600` maybe add `ROS_DOMAIN_ID` here
`uxrce_dds_client start -t serial -d /dev/ttyS2 -b 921600`
```
MAV_1_CONFIG = 0 (Disabled)
UXRCE_DDS_CFG = 102 (TELEM2)
SER_TEL2_BAUD = 921600
UXRCE_DDS_KEY = 1
UXRCE_DDS_DOM_ID = 161
UXRCE_DDS_AG_IP = 170524894
```
