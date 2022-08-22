#! /bin/bash

cat << print
Script installs docker and creates an Nginx container
A directory of host is mounted into container
The directory contains webserver files





print

apt update
apt upgrade


#install docker
cat << print
Docker installation started


print


mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker



#setup Nginx container
cat << print
Container creation started


print

docker pull nginx
#docker run --name dockernginx -p 80:80 -d nginx
docker run -d -v "$(pwd)":/hostdir -p 80:80 nginx
