#!/bin/bash

sudo apt install libtbb-dev
cd ~/Documents
git clone https://github.com/borglab/gtsam.git
cd gtsam
git checkout 4.2a7
mkdir build
cd build
cmake .. -DGTSAM_USE_SYSTEM_EIGEN=ON
make
sudo make install


cd ~/Documents
git clone https://github.com/lava/matplotlib-cpp.git
cd matplotlib-cpp
mkdir build
cd build
cmake ..
make
sudo make install

cd ~/Documents
git clone https://bitbucket.org/gmmregistration/gmm_registration.git
cd gmm_registration
#echo 'export GMM_REGISTRATION_PATH=/home/tim-external/Documents/gmm_registration' >> ~/.zshrc
mkdir build
cd build/
cmake ..
make
sudo make install

cd ~/underlay_ros2_ws
mkdir src
cd src

git clone https://github.com/timzarhansen/px4_msgs.git
git clone https://github.com/timzarhansen/soft20.git
git clone https://github.com/timzarhansen/commonBlueROVMSG.git
git clone https://github.com/timzarhansen/ping360_sonar.git
git clone https://github.com/timzarhansen/waterlinked_a50_dvl_ros2.git
git clone https://github.com/timzarhansen/Tritech-Micron-Driver.git
git clone https://github.com/timzarhansen/ping360_sonar_msgs.git
git clone https://github.com/timzarhansen/bluespace_ai_xsens_ros_mti_driver.git

cd ~/underlay_ros2_ws
colcon build

cd ~/ros2_ws
mkdir src
cd src

#git clone https://github.com/timzarhansen/BlueROV2Gazebo.git
git clone https://github.com/timzarhansen/BlueROV2Common.git
git clone https://github.com/timzarhansen/UnderwaterSlam.git
#




cd ~/ros2_ws
colcon build







