---
layout: default
title: Software Modules
parent: Autonomous Surface Vehicle Overview
nav_order: 2
---

## usv_control

**Location:** `src/modules/usv_control/`

Manual control module for surface vehicles. Converts RC stick inputs to thrust and yaw torque setpoints.

### Subscriptions
- `manual_control_setpoint` - RC joystick inputs
- `vehicle_control_mode` - Armed/manual mode flags
- `parameter_update` - Runtime parameter updates

### Publications
- `vehicle_thrust_setpoint` - Forward thrust command
- `vehicle_torque_setpoint` - Yaw torque command

### Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `USV_THRUST_MAX` | 1.0 | Maximum thrust output (0-1) |
| `USV_YAW_RATE_MAX` | 90.0 | Maximum yaw rate (deg/s) |
| `USV_THRUST_EXPO` | 0.5 | Throttle exponential curve |
| `USV_YAW_EXPO` | 0.5 | Yaw stick exponential curve |

### Control Logic

1. Apply exponential curve to stick inputs for finer control
2. Scale throttle to `USV_THRUST_MAX`
3. Scale yaw to `USV_YAW_RATE_MAX`
4. Publish thrust (X-axis) and yaw torque

---

## control_allocator

**Location:** `src/modules/control_allocator/`

Distributes thrust and torque commands to individual thrusters based on airframe configuration.

### Airframe Configuration

For WAM-V (`60003_gz_wamv`):
- **8 thrusters** configured via `CA_ROTOR0-7_*` parameters
- Thruster positions: `CA_ROTOR*_PX, PY, PZ`
- Thruster orientations: `CA_ROTOR*_AX, AY, AZ`
- All thrusters bidirectional: `CA_R_REV = 255`

---

## Gazebo Plugins

### GenericMotorModel
- **Purpose:** Thruster dynamics simulation
- **Configured in:** `model.sdf`
- **Parameters:**
  - `maxRotVelocity`: 1100 RPM
  - `motorConstant`: 10 N/(rad/s)
  - `bidirectionalMotor`: 1
  - Thrust polynomials for forward/reverse

### Surface (Buoyancy)
- **Purpose:** Catamaran hull buoyancy
- **Two instances:** Left and right hull
- **Hull length:** 4.9m
- **Hull radius:** 0.213m
- Wavefield integration for dynamic water

### Hydrodynamics
- **Purpose:** Drag and damping forces
- **Linear drag:** `xU=-51.3`, `yV=-40.0`, `nR=-400.0`
- **Rotational damping:** `kP=-50.0`, `mQ=-50.0`
