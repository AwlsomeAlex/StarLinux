#!/bin/bash
########################
#----------------------#
# Star Package Manager #
#----------------------#
########################
# Created by AwlsomeAlex [GNU GPLv3]
# Version: GIT

#############
# Variables #
#############
VER="GIT"
START_DIR=$(pwd)
REPO_DIR=/tmp/spm/repo

COMMAND="$1"
PACKAGE="$2"

RD='\033[1;31m'
GN='\033[1;32m'
YW='\033[1;33m'
BL='\033[1;34m'
NC='\033[0m'



### WARNING: When Running in Codenvy Use Command: `sed -i -e 's/\r$//' file` to get rid of garbage!


###################
# Child Functions #
###################
# Set of Functions to help aid
# Primary Functions for SPM

# download: Downloads a file from the SPM Repository
function download() {
	## Created by AwlsomeAlex [GNU GPLv3]
	## User-Friendly and Noise-Free Downloader powered by wget
	## NOTE: Modified for easy download of StarOS Repository
	FILE=$1
	TICKER=$2
	if [[ $FILE == "StarLinux" ]]; then
		wget https://github.com/AwlsomeAlex/StarLinux/archive/master.zip -q --show-progress
	elif [[ $FILE == "" ]]; then
		echo -e "${RD} Usage: download [file] [options]"
		echo -e "Options: -s (Silent Downloader Option)"
		echo -e "File: StarOS | Download Link${NC}"
	else
		if [[ $TICKER == "-s" ]]; then
			wget $FILE -q
		else
			wget $FILE -q --show-progress
		fi
	fi
}

# test: Dynamic Function to test certain functionality
function test() {
	echo "Hello World"
}



#####################
# Primary Functions #
#####################
# Functions which SPM is designed
# to execute, like package building

# update: Updates the StarLinux Repository [LINUX ONLY]
function update() {
	echo -e "${GN}StarLinux Package Manager - Updating Repository ${NC}"
	if [ -d /tmp/spm/repo ]; then
		rm -rf /tmp/spm/repo
	fi
	mkdir -p /tmp/spm/repo
	cd /tmp/spm
	download StarLinux
	unzip -q master
	rm -rf master.zip
	cp -r StarLinux-master/spm/repo/* repo/
	rm -rf StarLinux-master
	echo -e "${GN}Updated SPM Repo to $(cat /tmp/spm/repo/version.txt) ${NC}"
}

# build: Build a StarLinux Package for Operating System
function build() {
	if [ ! -d /tmp/spm ]; then
		update
	fi
	if [[ $PACKAGE == "" ]]; then
		echo -e "${RD}ERROR: ${NC}No Package Defined."
		exit 1
	fi
	if [ ! -d $REPO_DIR/$PACKAGE ]; then
		echo -e "${RD}ERROR: ${NC}Invalid Package '$PACKAGE'."
		exit 1
	fi
	cd $REPO_DIR/$PACKAGE
	echo -e "${GN}StarLinux Package Manager - Building $PACKAGE ${NC}"
	./build.sh
	cd $STAR_DIR
}

# list: Lists all packages available to be built from SPM
function list() {
	echo -e "${GN}StarLinux Package Manager - List Packages ${NC}"
	if [ -d $REPO_DIR ]; then
	   cat $REPO_DIR/list.txt
	else
	   echo -e "${RD}ERROR: ${NC}Repository not found. Please load with '$0 update'"
	   exit 1
	fi
}

# main: The main function which is executed when calling the script
function main() {
	case "$COMMAND" in
		update)
			update
			;;
		build)
			build
			;;
		list)
			list
			;;
		*)
			echo -e "${RD}Usage $0 [update, build]"
			echo -e "Commands:"
			echo -e "	list:			List packages available for SPM"
			echo -e "	update:			Update SPM Repository"
			echo -e "	build:			Build Package for StarLinux${NC}"
	esac
		
}

#####################
# Primary Execution #
#####################
# Main Function Execution
main
