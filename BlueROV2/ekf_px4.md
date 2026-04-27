---
layout: default
title: EKF and PX4
parent: BlueROV Overview
nav_order: 3
---

## EKF State Estimation

Fuses DVL velocity, IMU attitude, and barometer depth. Config in `config/ekfTUHHROS2.yaml`.

### Sensor Mounting Parameters

| Parameter | Description |
|-----------|-------------|
| `dvl_position` | DVL mounting offset [x, y, z] |
| `dvl_rotation` | DVL mounting orientation [roll, pitch, yaw] |
| `imu_position` | IMU mounting offset [x, y, z] |
| `imu_rotation` | IMU mounting orientation [roll, pitch, yaw] |
| `baro_position` | Barometer mounting offset [x, y, z] |
| `simulation` | `true` for Gazebo, `false` for real hardware |

### Key Outputs

| Topic | Type |
|-------|------|
| `/publisherPoseEkf` | `geometry_msgs/PoseWithCovarianceStamped` |
| `/publisherTwistEkf` | `geometry_msgs/TwistWithCovarianceStamped` |
| `/fmu/in/vehicle_visual_odometry` | `px4_msgs/VehicleOdometry` (to PX4) |

## PX4 Integration

MicroXRCEAgent bridges ROS 2 and PX4 over UDP port 8888. Started via `xrcClientStart.sh` in the main tube launch.

### Custom Modifications

- `px4_msgs` branch `uuv_bluerov` — custom message definitions for UUV
- `PX4Files/mixer/vectored6dof_sitl.main.mix` — 8-motor 6-DOF mixer config
- `controllerpx4bluerov2` — `UUVAttModeTest` PX4 mode (extends `px4_ros2::ModeBase`)

### Controller Mode

Attitude control via `px4_ros2::AttitudeSetpointType`. PID-based depth and position hold.

### Key ROS 2 Topics

#### PX4 Publications

| Topic | Type |
|-------|------|
| `/fmu/out/sensor_combined` | `px4_msgs/SensorCombined` |
| `/fmu/out/sensor_baro` | `px4_msgs/SensorBaro` |
| `/fmu/out/vehicle_local_position_v1` | `px4_msgs/VehicleLocalPosition` |
| `/fmu/out/vehicle_thrust_setpoint` | `px4_msgs/VehicleThrustSetpoint` |
| `/fmu/out/actuator_motors` | `px4_msgs/ActuatorMotors` |

#### Sensor Publications

| Topic | Type | Source |
|-------|------|--------|
| `/velocity_estimate` | `waterlinked_a50/TransducerReportStamped` | DVL |
| `/position_estimate` | `waterlinked_a50/PositionReportStamped` | DVL |
| `/imu/data` | `sensor_msgs/Imu` | Xsens MTi |
| `/pressure` | `sensor_msgs/FluidPressure` | Barometer |
| `/tritech_sonar/scan_lines` | `micron_driver_ros/ScanLine` | Micron sonar |
| `/sonar/image` | `sensor_msgs/Image` | Sonar visualization |

#### Services

| Service | Type | Purpose |
|---------|------|---------|
| `/power_control_bottom_service` | `bluerov2commonmsgs/RestartSonarService` | Bottom tube power |
| `/light_service` | custom | LED intensity |
| `/camera_angle_service` | custom | Gimbal angle |

#### Input

| Topic | Type | Purpose |
|-------|------|---------|
| `/desiredStateOfBluerov2` | `bluerov2commonmsgs/DesiredStateForRobot` | Desired vehicle state |
| `/magnetic_heading` | `geometry_msgs/Vector3Stamped` | Magnetic heading input |
