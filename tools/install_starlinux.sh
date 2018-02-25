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

mental_note () {
	logo
	menu
	echo "Just a little note I'd like to apply:"
	echo ""
	echo "I AM NOT RESPONCIBLE FOR ANYTHING THAT HAPPENS WITH YOUR MACHINE!"
	echo "Like a normal Linux Distribution, your files will have to be wiped and formatted."
	echo "And due to the lack of parititoning StarLinux gives, it will have to COMPLETELY wipe your disk."
	echo "If you do not care about this then please move on in the next 10 ticks, if you do PLEASE SHUTDOWN!"
	echo ""
	echo "Thanks, AwlsomeAlex"
	sleep 10
}

parititon_disk () {
	STATUS="Partitioning Disk..."
	logo
	menu
	echo "StarLinux Installer will now parititon your disk..."
	sleep 3
	echo "StarLinux needs to know which Hard Drive to install to. Please select one of the following, or type 'exit'."
	echo ""
	df -h
	echo ""
	read -p "Which drive should be used for installation? " ROOT_FS
		if [ $ROOT_FS == "c" ]; then
			STATUS="Exitting..."
			logo
			menu
			echo "You have aborted the StarLinux Installation Script. Have a nice day!"
			exit 0
		elif [ -e $ROOT_FS ]; then
			ROOT_FS="Invalid"
			STATUS="Error - Invalid Disk"
			logo
			menu
			echo "The Disk you've selected cannot be found."
			partition_disk
		else
			STATUS="Formatting Disk..."
			logo
			menu
			sleep 3
			echo "You have chosen $ROOT_FS to be your disk. It will now be partitioned and formatted."
			echo ""
			echo "Partitioning Disk $ROOT_FS..."
			echo -e "o\nn\np\n1\n\n\nw" | fdisk $ROOT_FS
			echo "Formatting $ROOT_FS with ext4..."
			mkfs.ext4 $ROOT_FS
			echo "Partitioning/Formatting Complete."
			cow_mount
		fi
		
}

cow_mount () {
	STATUS="Setting Mounts..."
	logo
	menu
	echo "StarLinux Installer is now preparing a special mount for ArchLinux called 'cowspace'."
	sleep 3
	mount -o remount,size=1G /run/archiso/cowspace
	echo "Cowspace Mounted."
	echo ""
	sleep 3
	echo "Mounting Temporary Filesystem..."
	mkdir /mnt/starlinux/
	mount -t ext4 $ROOT_FS /mnt/starlinux/
	echo "StarLinux Filesystem Mounted."
	starlinux_install
}

starlinux_install () {
	STATUS="Downloading Latest StarLinux..."
	logo
	menu
	echo "Installing latest archive of StarLinux InitramFS and Kernel..."
	# Add Download Part Later.
}
