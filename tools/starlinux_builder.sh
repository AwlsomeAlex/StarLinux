#!/bin/bash

#############################
# StarLinux Builder Utility #
#---------------------------#
#  Created by AwlsomeAlex   #
#############################
# StarLinux Builder Tool is an
# automatic utility which will
# build the StarLinux Kernel
# and create the initramfs,
# along with the filesystem 
# which will be installed in
# the StarLinux Arch Installer
# Script. Licensed GNU GPLv3!


## Settings ##
JOB_FACTOR=1
NUM_CORES=$(grep ^processor /proc/cpuinfo | wc -l)
NUM_JOBS=$((NUM_CORES * JOB_FACTOR))
KERN_VER="Undefined"
GLIBC_VER="Undefined"
BUSYBOX_VER="Undefined"

## Functions ##
logo () {
	clear
	echo ""
	echo "============================="
	echo "| StarLinux Builder Utility |"
	echo "|---------------------------|"
	echo "| Made by AwlsomeAlex GPLv3 |"
	echo "============================="
	echo ""
}

menu () {
	echo ""
	echo "================================="
	echo "| Linux Kernel     | $KERN_VER   "
	echo "| GlibC Library    | $GLIBC_VER  "
	echo "| BusyBox Userland | $BUSYBOX_VER"
	echo "================================="
	echo ""
}

sb_exit () {
	logo
	echo "StarBuilder will now exit."
	echo "Thank you for using StarBuilder!"
	echo "Created by AwlsomeAlex [GNU GPLv3]"
	exit
	
}

make_dir () {
	if [ -d /tmp/starbuilder ]; then
		logo
		echo "WARNING! The StarBuilder Directory has already been created. What action should be taken?"
		echo ""
		echo "1.) Overwrite Current StarBuilder Directory."
		echo "2.) Rename Current StarBuilder Directory."
		echo "3.) Cancel StarBuilder Completely."
		echo ""
		read DIR_OPTION
			if [ $DIR_OPTION == 1 ]; then
				logo
				echo "Overwritting Current StarBuilder Directory..."
				rm -rf /tmp/starbuilder
				echo "StarBuilder Directory Overwritten."
			elif [ $DIR_OPTION == 2 ]; then
				logo
				echo "Renaming Current StarBuilder Directory..."
				mv /tmp/starbuilder /tmp/starbuilder_$$
				rm -rf /tmp/starbuilder
				echo "StarBuilder Directory Overwritten."
			elif [ $DIR_OPTION == 3 ]; then
				sb_exit
			else
				logo
				echo "Invalid Option. Please choose again!"
				return 0
			fi
	fi
	logo
	echo "Creating Essential StarBuilder Directories..."
	mkdir /tmp/starbuilder
	mkdir -p /tmp/starbuilder/{Source,Work/Image,Image}
	echo "StarBuilder Directories Created."
}

#define_version () {
#	
#}

make_dir
