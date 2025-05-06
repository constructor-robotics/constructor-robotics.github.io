---
layout: default
title: ARIS Explorer 3000 
parent: Sensors Overview
nav_order: 4
---

# ARIS Explorer 3000:

Full manual for ARIS Explorere sonars, [here](https://www.manualslib.com/manual/2984232/Sound-Metrics-Aris-Explorer.html?page=1#manual)

## Simple connection (Windows+ARISCOPE)

1. Set-up the sonar and the cable connections as indicated in the [Setting Up the Explorer](https://www.manualslib.com/manual/2984232/Sound-Metrics-Aris-Explorer.html?page=12#manual) section in the manual.

2. If the sonar is not detected by the ARISCOPE software, please adjust the network settings as follows (see images below for reference):
    1. Go to `Control Panel > Network and Internet > Network Connections` and open the `Properties` of your LAN connection.
    2. Go into the `Configure` option and in the `Advanced` tab, set `Energy Efficient Ethernet` as `Off`.
    3. Go into the `Power Management` tab and disable the option `Allow the computer to turn off this device to save power`.
    4. In the section `Control Panel > System and Security > Windows Firewall` disable the firewall. (Note: Be aware of this when you resume normal work on your PC).

<div style="display: flex; gap: 10px;">
    <img src="../figures/sensors/ArisExplorer3000/windows-network-troubleshooting-1.png" alt="Image 1" width="200">
    <img src="../figures/sensors/ArisExplorer3000/windows-network-troubleshooting-1.png" alt="Image 2" width="200">
    <img src="../figures/sensors/ArisExplorer3000/windows-network-troubleshooting-1.png" alt="Image 3" width="200">
    <img src="../figures/sensors/ArisExplorer3000/windows-disable-firewall.png" alt="Image 4" width="200">
    <br>
</div>


The ARISCOPE GUI looks similar to this:

![ARISCOPE GUI](../figures/sensors/ArisExplorer3000/ariscope-gui.png)

## ROS 1 Data

Data or bagfiles acquired under ROS 1 have the following messages and topics.


| ROS1 Topic     | ROS 1 Msg Type   | Comment    |
|:---------------|:--------------|:---------------|
| /soundmetrics_aris3000/cartesian | sensor_msgs/Image  | See ROS docs for more info  |
| /soundmetrics_aris3000/polar  | sensor_msgs/Image  | See ROS docs for more info  |
| /soundmetrics_aris3000/sonar_info  | cola2_msgs/SonarInfo  | Propietary msg from MOPRH project, need to investigate  |




