---
layout: default
title: System Architecture
parent: BlueROV Overview
nav_order: 2
---

## Dual-Pi Architecture

| | Main Tube | Sensor Tube |
|---|---|---|
| **IP** | `192.168.10.2` | `192.168.10.3` |
| **User** | `maintube` | `sensortube` |
| **Role** | Camera, PWM thrusters, power management, PX4 comms | DVL, IMU, barometer, sonar |

Other devices:
- PX4: `192.168.10.11` (access via `sensortube`)
- DVL: `192.168.10.12` (access via `sensortube`)

## USB Devices

| Tube | Devices |
|------|---------|
| Main Tube | — |
| Sensor Tube | `/dev/ping360`, `/dev/xsens` |

## Nodes Per Tube

### Main Tube

| Node | Package | Launch File |
|------|---------|-------------|
| `xrcClientStart` | bluerov2common | `main_tube_startup.launch.py` |
| `pwmServices` (maintube) | bluerov2common | `main_tube_startup.launch.py` |
| `powerControl` | bluerov2common | `main_tube_startup.launch.py` |
| Camera node | bluerov2common | `main_tube.launch.py` |

### Sensor Tube

| Node | Package | Launch File |
|------|---------|-------------|
| `pwmServices` (sensortube) | bluerov2common | `sensor_tube_startup.launch.py` |
| `barometer_sensor_tube` | bluerov2common | `sensor_tube_startup.launch.py` |
| `dvl_node` | waterlinked_a50 | `dvl.launch.py` |
| `ping360` | ping360_sonar | `ping360.launch.py` |
| `xsens_mti_node` | bluespace_ai_xsens_mti_driver | `imu.launch.py` |

### EKF

| Launch | Purpose |
|--------|---------|
| `ekf_robot.launch.py` | Real hardware (sensor offsets from config) |
| `ekf_gazebo.launch.py` | Simulation (zero offsets) |

## Data Flow

```
DVL → ┐
IMU  → ├→ EKF → /fmu/in/vehicle_visual_odometry → PX4 → Thrusters
Baro → ┘
```

## Deployment

Copy built workspace to both Pis:

```bash
bash bashScripts/copyROSPackagesToBlueROV.sh
```
