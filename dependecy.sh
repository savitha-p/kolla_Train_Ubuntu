#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible -y
apt update
apt-get install python-dev libffi-dev gcc libssl-dev python-selinux lvm2 ansible -y
