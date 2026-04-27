---
layout: default
title: WAM-V Simulation
parent: Autonomous Surface Vehicle Overview
nav_order: 1
---

## Prerequisites

### Clone the USV-enabled PX4 fork

```bash
git clone -b dev-surface-vehicle https://github.com/constructor-robotics/PX4-Autopilot.git --recursive
cd PX4-Autopilot
```

This pulls:
- **PX4-Autopilot**: branch `dev-surface-vehicle` (commit `cdc973de5b`)
- **Gazebo Models submodule**: branch `dev-surface-vehicle-gz` from `constructor-robotics/PX4-gazebo-models`

## Running the Simulation

### Launch WAM-V in Gazebo

```bash
make px4_sitl gz_wamv
```

This starts:
1. PX4 SITL with USV configuration
2. Gazebo with WAM-V catamaran model
3. World: Sydney Regatta (water environment)

### Expected Behavior

- WAM-V spawns floating on water
- Two main thrusters (stern-mounted) + six additional thrusters
- Buoyancy and hydrodynamics active
- Sensors: IMU, magnetometer, barometer, GPS

### Basic Controls

Connect QGroundControl or use RC input:
- **Throttle**: Forward/backward thrust
- **Yaw**: Left/right rotation

The vehicle uses differential thrust for maneuvering.

### Data Flow

```
RC Input → usv_control → control_allocator → 8 Thrusters → Gazebo Physics
```

### Troubleshooting

**Module not starting:**
```bash
usv_control start
control_allocator start
```

**No thrust response:**
- Check `MAV_TYPE` is set to `14` (surface boat)
- Verify `CA_ROTOR_COUNT` = 8
- Confirm thruster parameters `CA_ROTOR0-7_*` are set

**Gazebo crashes:**
- Ensure Gazebo Harmonic/Garden is installed
- Check submodule is updated: `git submodule update --recursive`
