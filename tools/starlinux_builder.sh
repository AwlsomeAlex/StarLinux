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

make_dir () {
		
}

define_version () {
	
