#!/bin/bash
# Shell script to clone everything into Moodle
# Author: poodll

#edit this if this setup.sh script is in a diff location
echo "upgrading to PHP7"
~/workspace/scripts/setup_php7.sh

echo "setting up Moodle"
~/workspace/scripts/setup_moodle.sh

