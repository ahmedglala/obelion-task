#!/bin/bash
apt update -y
apt install -y docker.io docker-compose-plugin
usermod -aG docker ubuntu
systemctl enable docker