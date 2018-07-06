#!/bin/bash
####################################
#----------------------------------#
# Star Package Builder - Protostar #
#----------------------------------#
####################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPB vGIT

. ../common.lib

#----- Build Info -----#
# Version Number: GIT
# Last Build: None
# Build Status : N/A
# Indentifier: AwlsomeAlex


#----- Executable -----#
if [ -d $MAIN_DIR ]; then
	message WARN "A Protostar Directory has been detected at '$MAIN_DIR'. Would you like to delete this [Y or N]?"
	read TF
	if [ "$TF" = "Y" ]; then
		message .... "Deleting Protostar Directories..."
		rm -rf $FINAL_DIR
		rm -rf $WORK_DIR
		rm -rf $SRC_DIR
		rm -rf $MAIN_DIR
		message DONE "Deleted Protostar Directories."
	else
		exit 2
	fi
fi
message .... "Creating Protostar Directories..."
mkdir -p $MAIN_DIR
mkdir -p $SRC_DIR
mkdir -p $WORK_DIR
mkdir -p $FINAL_DIR
if [ ! -d $REPO_DIR ]; then
	message ERROR "The SPB Repository could not be found at '$REPO_DIR'. Please run 'spb update' or THIS WILL CAUSE PROBLEMS!"
fi
if [ -d $STAR_DIR ]; then
	message DONE "Created Protostar Directories. Ready for packages to be built with Star Package Builder 'spb build PACKAGE' then converted into a Disk Image 'spb build image' or packaged with 'spb build archive'."
else
	message ERROR "The Protostar Directories could not be found! Possibly a problem with permissions or filled disk?"
fi
