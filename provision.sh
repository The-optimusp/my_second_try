#!/bin/bash

echo "in provision script"

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker

groupadd docker
usermod -aG docker vagrant
# hostnamectl --transient --pretty --static set-hostname docker
yum update -y

## Import and build mongodb 

docker pull mongo:latest
docker build -t my_mongo 
