#!/bin/sh
echo "
10.10.10.55 controller
10.10.10.54  compute" > /etc/hosts
systemctl stop iscsid.socket
systemctl disable iscsid.socket
apt-get update
apt-get install python-pip sshpass -y
pip install -U pip
sudo echo -e "yes\n100%" | parted /dev/sda ---pretend-input-tty unit % resizepart 3
resize2fs /dev/sda3
