#!/bin/bash
# Created by AwlsomeAlex (GNu GPLv3)
# Version GIT


############################
# StarLinux Installer Tool #
#--------------------------#
#  Created by AwlsomeAlex  #
############################
# The main intention for this tool
# is to use the precompiled linux
# kernel and initramfs and use the
# power of ArchLinux Live CD to 
# fully install the StarLinux
# Linux Distribution until an install
# disk creator script can be installed.

## Settings ##
STATUS="Undefined"
ROOT_FS="Undefined"

## Functions ##
logo () {
	clear
	echo ""
	echo "================================="
	echo "| StarLinux Installation Script |"
	echo "|-------------------------------|"
	echo "|  Made by AwlsomeAlex (GPLv3)  |"
	echo "================================="
	echo ""
}

menu () {
	echo ""
	echo "==========================================="
	echo "| Installation Status: $STATUS     "
	echo "|------------------------------------------"
	echo "| Root Parititon: $ROOT_FS     "
	echo "==========================================="
	echo ""
}

