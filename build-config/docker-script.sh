#! /usr/bin/bash

sudo yum install docker -y
sudo systemctl start docker
sudo docker build -t $1 /home/ec2-user/build-config
