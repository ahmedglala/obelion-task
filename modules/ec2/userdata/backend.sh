#!/bin/bash
apt update -y
apt install -y php8.1 php8.1-cli php8.1-mbstring php8.1-xml php8.1-mysql php8.1-zip unzip curl git
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer