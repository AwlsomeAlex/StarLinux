#!/bin/bash

########################
# -------------------- #
# Star Package Builder #
# -------------------- #
########################
# Main executable for
# SPB script
########################
# Created by AwlsomeAlex
# Copyright (C) 2018 Alex Barris - All Rights Reserved
# Awlsome Public License v1.0
# Version v0.21a

#############
# Variables #
#############
# Local Variables for SPB
ARGS=("$@") # [0] = $1, [1] = $2
START_DIR=$(pwd)
COMMON_LIB="common.lib" #REQUIRED DIRECTORY
SPB_CONFIG="spb.config" #REQUIRED DIRECTORY

#############
# Functions #
#############
# All functions defined by SPB

# spb_update: Updates SPB Repository Directory
function spb_update() {
	common_title "Repository Update"
	if [ -d "$REPO_DIR" ]; then
		rm -rf $REPO_DIR
	fi
	mkdir -p $REPO_DIR
	cd $REPO_DIR/..
	common_print "Downloading Repository...." -s ....
	common_download $REPO_LINK $REPO_DIR/..
	common_print "Repository Downloaded!" -s DONE
	common_print "Extracting Repository...." -s ....
	unzip StarLinux-master.zip >> /dev/null
	rm -rf StarLinux-master.zip*
	mv $SPB_DIR/StarLinux-master/repo/* $REPO_DIR/
	rm -rf StarLinux-master
	common_print "Repository Extracted!" -s DONE
	common_print "Updated Star Package Repository to $(cat $REPO_DIR/version.txt)" -c Blue
}

# spb_build: Builds a specific componient of StarLinux
function spb_build() {
	common_title "Building ${ARGS[1]}"
	if [ ! -d "$REPO_DIR" ]; then
		common_print "Please update the repository first with '$0 update'!" -s FAIL
		exit
	fi
	if [ "${ARGS[1]}" == "" ]; then
		common_print "No Package Defined!" -s FAIL
	fi
	if [ ! -d "$REPO_DIR/${ARGS[1]}" ]; then
		common_print "Invalid Package '${ARGS[1]}'" -s FAIL
		exit
	fi
	source "$REPO_DIR/${ARGS[1]}/${ARGS[1]}.spb"
	PACKAGE=${ARGS[1]}
	build_${ARGS[1]}
	cd $START_DIR
}

# spb_clean: Cleans out and archives the StarLinux Directory
function spb_clean() {
	if [ -d $SPB_DIR ]; then
		common_print "The StarLinux Directory is currently in use, would you like to archive it? (Y/n)"
		read -p "Enter Option: " input
		if [ "$input" == "Y" ]; then
			common_print "Archiving StarLinux Directory...." -s ....
			cd $SPB_DIR
			tar -cJvf $ARCHIVE_FILE *
			cd $START_DIR
			common_print "Archived StarLinux Directory." -s DONE
		fi
		common_print "The StarLinux Directory will now be deleted. Would you like to continue? (Y/n)" 
		read -p "Enter Option: " input
		if [ "$input" == "Y" ]; then
			common_print "Deleting StarLinux Directory...." -s ....
			rm -rf $SPB_DIR
			common_print "Deleted StarLinux Directory." -s DONE
		else
			common_print "Canceled by User." -s FAIL
		fi
	else
		common_print "The StarLinux Directory is not prepared, you can prepare it with '$0 update'" -s FAIL
	fi
}

#################
# Main Function #
#################
# Entry Point of the program
function main() {
	clear
	if [ -f $COMMON_LIB ] && [ -f $SPB_CONFIG ]; then
		source "$COMMON_LIB"
		source "$SPB_CONFIG"
	else
		echo -e "\033[1;31m!!!ERROR!!! main: \033[0mcommon.lib and spb.config could not be sourced!"
	fi
	common_print "Common Library $COMMONLIB_VER Sourced!" -c Blue
	common_print "Configuration File Found and Loaded!" -c Blue
	common_print "$TITLE" -c Yellow
	case "${ARGS[0]}" in
		update)
			spb_update
			;;
		build)
			spb_build
			;;
		clean)
			spb_clean
			;;
		test)
			common_test
			;;
		*)
			common_title "Usage"
			common_print "Usage: $0 [update, build]" -c Red
			common_print "		update:		Updates Star Package Repository" -c Red
			common_print "		build:		Builds a specific componient of StarLinux" -c Red
			common_print "		clean:		Cleans (and archives) StarLinux Directories" -c Red
	esac
}
main
