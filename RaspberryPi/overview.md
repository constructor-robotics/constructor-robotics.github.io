---
layout: default
title: Raspberry Pi Overview
has_children: true
nav_order: 3
---

# Logging in without a PW:
```
ssh-keygen
```
to create a key on host PC.
```
ssh-copy-id userid@hostname
```
This copies the public key to the pi


# Synchronize Time of PIs:
```
https://raspberrypi.stackexchange.com/questions/89675/sync-time-for-all-raspberry-pis-on-local-network-without-internet
https://pimylifeup.com/raspberry-pi-time-sync/
```

# Install pigpio:
This package can run hardware PWM signals. make sure unzip is installed 
```
cd ~/Documents
sudo wget https://github.com/joan2937/pigpio/archive/master.zip
sudo unzip master.zip
cd pigpio-master
sudo make
sudo make install
sudo pigpiod

```

# Install OpenCV on Pi:
```
sudo apt update -y
sudo apt upgrade -y

sudo apt install build-essential libgtk2.0-dev libgtk-3-dev -y

cd ~/Documents
mkdir opencvInstall
cd opencvInstall

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
mkdir build
cd build
cmake -DOPENCV_ENABLE_NONFREE:BOOL=ON -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ../opencv
cmake --build . --config Release -- -j 2
sudo make install

```

# Swap on:
Creates a simple 8GB swap file 
```
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```




# install GTsam
```
sudo apt install libtbb-dev
cd ~/Documents
git clone https://github.com/borglab/gtsam.git
cd gtsam
git checkout 4.1.1


mkdir build
cd build
cmake ..
make
sudo make install
```







