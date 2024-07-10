---
layout: default
title: Raspberry Pi Overview
has_children: true
nav_order: 3
---

# Just test this side big

Connect directly to the Pi without PW:https://serverfault.com/questions/241588/how-to-automate-ssh-login-with-password


# Synchronize Time of PIs:
```
https://raspberrypi.stackexchange.com/questions/89675/sync-time-for-all-raspberry-pis-on-local-network-without-internet
https://pimylifeup.com/raspberry-pi-time-sync/
```

# Install pigpio:
```
cd ~/Documents
sudo wget https://github.com/joan2937/pigpio/archive/master.zip
sudo unzip master.zip
cd pigpio-master
sudo make
sudo make install
sudo pigpiod

```