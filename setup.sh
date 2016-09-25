#!/bin/bash
# Shell script to clone everything into Moodle
# Author: poodll

# start from home directory
cd /home/ubuntu

#make Moodle data dir
mkdir moodledata
chmod 777 moodledata

#make moodle program directory
git clone git@github.com:moodle/moodle.git workspace
