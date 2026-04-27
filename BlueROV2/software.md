---
layout: default
title: Software Setup
parent: BlueROV Overview
nav_order: 1
---

## Development Environment

Docker devcontainer with Ubuntu 22.04 + ROS 2 Humble. Designed for CLion.

```bash
# Clone workspace
git clone git@github.com:constructor-robotics/bluerovws.git
cd bluerovws
```

Launch devcontainer (CLion or VSCode Dev Containers extension). Workspace mounts at `/home/bluerovuser/volumeROS` inside the container.

## External Dependencies

From inside the workspace root:

```bash
bash bashScripts/downloadBasicPackages.sh
```

Clones into `src/`:
- `bluespace_ai_xsens_mti_driver` — Xsens MTi IMU driver
- `ping360_sonar` / `ping360_sonar_msgs` — Blue Robotics Ping360
- `waterlinked_a50` — Waterlinked A50 DVL driver
- `micron_driver_ros` — Tritech Micron sonar driver
- `bluerov2commonmsgs` — Custom message definitions
- `bluerov2common` — Core package (EKF, PX4 controller, barometer)
- `gui_bluerov` — GUI application
- `px4_msgs` (branch `uuv_bluerov`) — Custom PX4 messages
- `px4-ros2-interface-lib` (tag 1.5.0) — PX4 ROS 2 interface

## Build

Inside the devcontainer:

```bash
cd ~/ros_ws
colcon build
source install/setup.bash
```

## Base Station Network Config

### Linux

```bash
# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# NAT masquerading and firewall rules
sudo iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE
sudo iptables -A FORWARD -i $EXT -o $INT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $INT -o $EXT -j ACCEPT
sudo netfilter-persistent save

# DNS forwarding
sudo resolvectl dns eth0 1.1.1.1
```

### macOS

```bash
# Edit pf.conf (en8=outside, en7=to ROV)
sudo nano /etc/pf.conf
# Add: nat on en8 from en7:network to any -> (en8)

# Enable forwarding
sudo sysctl -w net.inet.ip.forwarding=1
sudo sh -c 'echo "net.inet.ip.forwarding=1" >> /etc/sysctl.conf'

# Load rules
sudo pfctl -f /etc/pf.conf
sudo pfctl -e
```
