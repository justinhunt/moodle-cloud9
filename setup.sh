#!/bin/bash
# Shell script to clone everything into Moodle
# Author: poodll

#edit this if this setup.sh script is in a diff location
echo "upgrading to PHP7"
~/workspace/scripts/setup_php7.sh

echo "setting up Moodle"
~/workspace/scripts/setup_moodle.sh

echo "all done. Now 'run' the project and navigate to https://$cloud9_workspace-$cloud9_username.c9users.io/moodle to complete the installation of Moodle"


