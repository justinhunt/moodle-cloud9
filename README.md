# moodle-cloud9
A script(s) to use for setting up a Moodle development environment on Cloud9 ( https://c9.io ) 

Instructions
===
1. Setup an account on https://c9.io (free account is ok)
2. Make a note of your username ... we are going to need that.
3. From the new account make a new workspace (note the workspace name, we'll need that too)
  * Workspace Type: "Hosted workspace"
  * Clone from Git URL: "https://github.com/justinhunt/moodle-cloud9.git"
  * Template: "PHP,Apache .."
4. From the bash window of the new workspace, type ./setup.sh
This will upgrade PHP to PHP 7 and install necessary dependencies. Then it will install Moodle.
5. If prompted to approve installing php curl, accept by typing 'Y'
6. When prompted for your username, enter it
7. When prompted for your workspace name, enter it
8. When its finished running, click the "Run Project" button at top
9. Navigate to the URL that the setup script finished with, and finish the install
10. Remove "setup.sh" and "config.php" and "scripts" directory from the workspace directory. 
11. Happy Moodle Coding!