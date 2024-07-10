---
layout: default
title: Sensors Overview
has_children: true
nav_order: 6
---

# Overview for Sensor setting/setups




# Static USB Assignment for sensors #

In order to avoid the hassle of finding out what ports our sensors will reconnect to each time we disconnect them,
we can assign a static name to a USB port and our device will always connect to the right port no matter where it is
plugged in.

In order to do this we have to follow the next steps:

- List attributes for device:
  `udevadm info --name=/dev/ttyUSBx --attribute-walk` - where x is a number matching your device port.
- In the attributes list look out for the attributes that is unique for each device (e.g. `idVendor`, `idProduct`)
- If you found those attributes open (or create and open if it does not exist) the following file: `/etc/udev/rules.d/99-usb-serial.rules`
- If the unique attributes were found, write a similar rule in the file we just opened: `SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", SYMLINK+="ping360"
  `. In this case, the command we used is specifically made for the Ping360 sonar from Blue Robotics)
- Apply the rules: `sudo udevadm control --reload-rules && sudo udevadm trigger`
- To check if rules were applied correctly execute: `ls /dev/ping360 -l`. In general cases, replace ping360 with the name
  inserted in the SYMLINK attribute of the created rule.
- You should see a similar result:

`lrwxrwxrwx 1 root root 7 Nov  2 12:49 /dev/ping360 -> ttyUSB0`