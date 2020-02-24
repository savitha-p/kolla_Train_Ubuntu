#!/bin/sh
#sudo su
#echo "***************permit root login****************"
sed -i '/#PermitRootLogin/c PermitRootLogin yes' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication/c PasswordAuthentication yes' /etc/ssh/sshd_config
sed -i '/^GSSAPIAuthentication/c GSSAPIAuthentication yes' /etc/ssh/sshd_config
#echo 'AllowUsers root' >> /etc/ssh/sshd_config
echo "**************service sshd start****************"
yes password | sudo passwd root
#echo -e "password\npassword" | sudo passwd root
sudo service ssh restart
