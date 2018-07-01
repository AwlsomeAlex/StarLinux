#!/bin/bash

########################
#----------------------#
# Star Package Manager #
#----------------------#
########################
# Created by AwlsomeAlex [GNU GPLv3]
# Protostar Branch

#############
# Variables #
#############
REPO_DIR="/tmp/spm/repo" # ONLY VARIABLE NOT DEFINED BY CONFIG!
RD='\033[1;31m'
GN='\033[1;32m'
NC='\033[0m'

##################
# Child Function #
##################
function download_repo() {
	if [ -d $REPO_DIR ];
		message WARN "The Repository is already downloaded! Continuing..."
	else
		echo -e "${GN}StarLinux Package Manager - Downloading Repository ${NC}"
		mkdir -p $REPO_DIR
		cd $REPO_DIR/..
		wget https://github.com/AwlsomeAlex/StarLinux/archive/protostar.zip -q --show-progress
		unzip -q protostar.zip
		rm -rf protostar.zip
		cp -r StarLinux-protostar/repo/* repo/
		rm -rf StarLinux-protostar
	fi
}


if [ ! -d $REPO_DIR ]; then
	download_repo
fi
. $REPO_DIR/common.lib
run_lib

