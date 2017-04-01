#!/bin/bash
# Shell script to clone everything into Moodle
# Author: poodll

#edit this if this setup.sh script is in a diff location
SETUPDIR=~/workspace

#make Moodle data dir
echo "Making Moodle data directory .."
mkdir ~/moodledata
chmod 777 ~/moodledata

#make moodle program directory
echo "cloning Moodle from git .."
cd ~/workspace
git clone https://github.com/moodle/moodle.git moodle
cd moodle
git branch --track MOODLE_31_STABLE origin/MOODLE_31_STABLE
git checkout MOODLE_31_STABLE

#need php5-curl
sudo apt-get update
sudo apt-get install php5-curl

#make moodle config 
echo "Making Moodle config file.."
cp ${SETUPDIR}/config.php config.php
echo "Enter your Cloud9 username .."
read cloud9_username
echo "Enter your Cloud9 workspace name .."
read cloud9_workspace

sed -i "s/@@USERNAME@@/$cloud9_username/g" config.php
sed -i "s/@@WORKSPACE@@/$cloud9_workspace/g" config.php

#start database
mysql-ctl start

echo "all done. Now 'run' the project and navigate to https://$cloud9_workspace-$cloud9_username.c9users.io/moodle to complete the installation"


