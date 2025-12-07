#!/bin/bash
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common ca-certificates lsb-release apt-transport-https unzip curl git

# 2. إضافة repo رسمي لـ PHP 8.3 (Ondřej Surý – كل الناس بتستخدمه)
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

# 3. تثبيت PHP 8.3 + كل الـ extensions اللي Laravel محتاجها
sudo apt install -y php8.3 php8.3-cli php8.3-common php8.3-mbstring php8.3-xml php8.3-bcmath \
                    php8.3-zip php8.3-mysql php8.3-curl php8.3-gd php8.3-intl

عالميًا
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

sudo apt install -y mysql-client

# 6. إيقاف وتعطيل Apache2 لو موجود (عشان ما يتعارضش مع Laravel)
sudo systemctl stop apache2 2>/dev/null || true
sudo systemctl disable apache2 2>/dev/null || true
sudo systemctl stop nginx 2>/dev/null || true
sudo systemctl disable nginx 2>/dev/null || true
