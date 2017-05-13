#!/bin/bash
# Shell script to upgrade cloud9 php 5.x to php 7
# Author: poodll (from https://community.c9.io/t/how-to-upgrade-a-php-workspace-to-version-7/8570 )

echo "update repos so we can get php7"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

echo "install php7 and friends"
sudo apt-get install php7.0-curl php7.0-cli php7.0-dev php7.0-gd php7.0-intl php7.0-mcrypt php7.0-json php7.0-mysql php7.0-opcache php7.0-bcmath php7.0-mbstring php7.0-soap php7.0-xml php7.0-zip -y

echo "installing libapache2-mod-php7.0"
sudo mv /etc/apache2/envvars /etc/apache2/envvars.bak
sudo apt-get remove libapache2-mod-php5 -y
sudo apt-get install libapache2-mod-php7.0 -y

echo "backing up envvars"
sudo cp /etc/apache2/envvars.bak /etc/apache2/envvars

echo "install PHP7 XML-RPC"
sudo apt-get install php7.0-xmlrpc -y

echo "install xdebug"
sudo apt-get install php-xdebug -y
sudo echo "xdebug.remote_enable=1" >> /etc/php/7.0/mods-available/xdebug.ini  



