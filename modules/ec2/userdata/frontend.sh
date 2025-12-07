#!/bin/bash
set -e  
apt-get update -y

apt-get install -y ca-certificates curl gnupg lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

# تثبيت Docker Engine + Compose Plugin
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# إضافة الـ user ubuntu لمجموعة docker عشان يشتغل بدون sudo
usermod -aG docker ubuntu

# تشغيل Docker service
systemctl enable docker
systemctl start docker

echo "Docker + Docker Compose installed successfully!" > /var/log/user-data.log
