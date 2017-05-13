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
git branch --track MOODLE_32_STABLE origin/MOODLE_32_STABLE
git checkout MOODLE_32_STABLE

#need php curl
sudo apt-get update
sudo apt-get install php-curl

#make moodle config 
echo "Making Moodle config file.."
cp ${SETUPDIR}/config.php config.php
echo "Enter your Cloud9 username .."
read cloud9_username
echo "Enter your Cloud9 workspace name .."
read cloud9_workspace

sed -i "s/@@USERNAME@@/$cloud9_username/g" config.php
sed -i "s/@@WORKSPACE@@/$cloud9_workspace/g" config.php

#install the skeleton tool for making a new plugin
echo "Now lets install the skeleton tool"
git clone https://github.com/mudrd8mz/moodle-tool_pluginskel.git ${SETUPDIR}/moodle/admin/tool/pluginskel
echo "done (installing skeleton tool)"

#Setup the Node js and Grunt environment
cd  ${SETUPDIR}/moodle
npm install
npm install -g grunt-cli

#start database
echo "Now lets start mysql"
mysql-ctl start
echo "done (starting mysql)"

#install phpmyadmin
echo "Now lets install phpmyadmin"
phpmyadmin-ctl install
echo "done (installing phpmyadmin)"


echo "all done. Now 'run' the project and navigate to https://$cloud9_workspace-$cloud9_username.c9users.io/moodle to complete the installation"


