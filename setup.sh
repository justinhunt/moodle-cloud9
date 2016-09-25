#!/bin/bash
# Shell script to clone everything into Moodle
# Author: poodll

# start from home directory
cd /home/ubuntu

#make Moodle data dir
mkdir moodledata
chmod 777 moodledata

#make moodle program directory
rm -f workspace/*
cd workspace
git clone git@github.com:moodle/moodle.git moodle
git branch --track MOODLE_31_STABLE origin/MOODLE_31_STABLE
git checkout MOODLE_31_STABLE

#make moodle config 
cp /home/ubuntu/cloud9/config.php /home/ubuntu/workspace/moodle/config.php
cd /home/ubuntu/workspace/moodle
sed -i 's/@@USERNAME@@/$1/g' config.php
sed -i 's/@@WORKSPACE@@/$2/g' config.php

#start database
mysql-ctl start

#perform installation
php /home/ubuntu/workspace/moodle/admin/cli/install.php

