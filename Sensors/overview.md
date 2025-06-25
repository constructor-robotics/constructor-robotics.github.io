---
layout: default
title: Sensors Overview
has_children: true
nav_order: 6
---

# Overview for Sensor setting/setups




# Static USB Assignment for sensors 

In order to avoid the hassle of finding out what ports our sensors will reconnect to each time we disconnect them,
we can assign a static name to a USB port and our device will always connect to the right port no matter where it is
plugged in.

In order to do this we have to follow the next steps:

- List attributes for device with lsusb:
  lsusb output looks like this:
  `Bus 001 Device 005: ID **1234**:**5678** Some Device Name`
  VENDOR_ID is the first four-digit hex number (1234 in this example). PRODUCT_ID is the second (5678).  Use those values (without "0x") in your udev rule.
- If you found those attributes open (or create and open if it does not exist) the following file: `/etc/udev/rules.d/99-usb-serial.rules`
- If the unique attributes were found, write a similar rule in the file we just opened: `SUBSYSTEM=="tty", ATTRS{idVendor}=="1234", ATTRS{idProduct}=="5678", SYMLINK+="ping360"
  `. In this case, the command we used is specifically made for the Ping360 sonar from Blue Robotics)
- Apply the rules: `sudo udevadm control --reload-rules && sudo udevadm trigger`
- To check if rules were applied correctly execute: `ls /dev/ping360 -l`. In general cases, replace ping360 with the name
  inserted in the SYMLINK attribute of the created rule.
- You should see a similar result:

`lrwxrwxrwx 1 root root 7 Nov  2 12:49 /dev/ping360 -> ttyUSB0`


# Start bottom tube without ROS:
```
sudo pigpiod
python3
import pigpio
resetPin = 18
gpioPinSonar = pigpio.pi()
gpioPinSonar.set_mode(resetPin, pigpio.OUTPUT)
gpioPinSonar.write(resetPin, 1)
```
