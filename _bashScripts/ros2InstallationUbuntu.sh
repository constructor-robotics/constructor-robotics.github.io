#!/bin/bash
sudo apt update -y
sudo apt upgrade -y



#general programs that are important
sudo apt install htop -y
sudo apt install net-tools -y
sudo apt install git-all -y


# ROS installation starts here
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update -y
sudo apt upgrade -y

sudo apt install ros-humble-desktop -y
sudo apt install ros-dev-tools -y
sudo apt install ros-humble-tf2-geometry-msgs ros-humble-tf2 -y

#echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
#source ~/.bashrc





#sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
#sudo apt install python3-catkin-tools python3-osrf-pycommon -y
sudo apt-get install chrome-gnome-shell -y
sudo apt install vlc -y
sudo apt update -y
#sudo apt install ros-humble-gazebo-dev -y
#sudo apt install ros-humble-gazebo-plugins* -y
sudo apt install texlive-full  -y

#sudo apt install libopencv-dev python3-opencv -y
sudo apt install libfftw3-dev -y
sudo apt install terminator -y
sudo apt install htop -y
sudo apt install python3-pip -y
sudo apt install libqt5gamepad5* -y
sudo apt install curl -y
sudo apt install libcgal-dev -y
pip3 install --user pyquaternion
sudo apt install nlohmann-json3-dev -y



#cd ~
#mkdir -p ~/ros2_ws/src
#cd ~/ros2_ws
#
#sudo rosdep init
#rosdep update
#
#source ~/.bashrc

#git clone https://github.com/timzarhansen/installationInstructions.git
#cd ..
#source ~/.bashrc
#colcon build --parallel-workers 2
#
#
#echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
#cd ~
#source ~/.bashrc





