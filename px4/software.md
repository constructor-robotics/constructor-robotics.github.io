---
layout: default
title: PX4 Software
parent: PX4 and Pixhawk
nav_order: 2
---

Just test this side


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
