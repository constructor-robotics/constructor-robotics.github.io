---
layout: default
title: Ubuntu
parent: Linux and ROS Overview
nav_order: 2
---

# install Ubuntu on an external harddrive
Here a description how to install GRUB to make external drive really external.

`https://www.58bits.com/blog/2020/02/28/how-create-truly-portable-ubuntu-installation-external-usb-hdd-or-ssd`


# Shell Settings

Make the shell more colorful:
`echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '">> ~/.bashrc`



# Network
Base Station Config Linux
1. set static IP
2. sudo sysctl -w net.ipv4.ip_forward=1 (should stay)
3. sudo iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE
4. sudo iptables -A FORWARD -i $EXT -o $INT -m state --state RELATED,ESTABLISHED -j ACCEPT
5. sudo iptables -A FORWARD -i $INT -o $EXT -j ACCEPT
6. sudo netfilter-persistent save
7. sudo resolvectl dns eth0 1.1.1.1 (forward dns to find ip addresses on PI)
8. on pi: include DNS=1.1.1.1 at /etc/systemd/resolved.conf to configure at boot

MACOS:
1. sudo nano /etc/pf.conf
2. Add something like this at the top or under nat-anchor if it exists: nat on en8 from en7:network to any -> (en8)
3. en8 is outside, and en7 is to PI
3. sudo sysctl -w net.inet.ip.forwarding=1
4. Permanent: sudo sh -c 'echo "net.inet.ip.forwarding=1" >> /etc/sysctl.conf'
5. sudo pfctl -f /etc/pf.conf
6. sudo pfctl -e
7. sudo pfctl -n -f /etc/pf.conf