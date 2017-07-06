#!/bin/sh
# Created by AwlsomeAlex (GNU GPLv3)
# Static-Get by Javier Lopez
# Version GIT

########################
# Star Package Manager #
########################
# Star Package Manager is a 
# simple to use package manager
# that integrates the static-get
# and installs the programs it
# downloads and extracts onto
# the StarLinux Root Directory.
# The way it will work is this
# scirpt will retrieve a formula
# from the StarLinux Repository
# and will execute the commands
# needed to give your system that
# program. 

# Functions:
display_help () {
	cat /etc/spm/help.txt
}













# Check for options:

if [ -f "./spm.sh" ]; then
	install_spm
fi

if [ "\$1" = "" -o "\$1" = "-h" -o "\$1" = "--help" ] ; then
	display_help
elif [[ "\$1" = $(grep -r "\$1" "/etc/spm/packages.txt") ]] ; then
	install_package
else
	echo "SPM: Invalid Command! Please type `spm` for help."
fi


