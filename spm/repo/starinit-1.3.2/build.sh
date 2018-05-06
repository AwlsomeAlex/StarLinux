#!/bin/bash
###################################
#---------------------------------#
# Star Package Manager - StarINIT #
#---------------------------------#
###################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGit

. ../common.lib

#---- Build Info ----#
# Version Number: 1.3.2
# Last Build: 5/6/18 12:32am EST
# Build Status: TESTING....
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://github.com/AwlsomeAlex/starinit/archive/v1.3.2.tar.gz"
STARINIT_VER="1.3.2"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}


#---- Executable ----#
#echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!{NC}"
depends Nebula
message .... "Downloading and Extracting StarINIT...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE starinit
message done "Downloaded and Extracted StarINIT."
message .... "Preparing StarINIT...."
mkdir -p $WORK_DIR/starinit/starinit
cd $WORK_DIR/starinit/starinit-*
cp -r src/* $WORK_DIR/starinit/starinit
message done "Prepared StarINIT."
message .... "Configuring StarINIT...."
sed -i "21s/.*/STARLINUX_BUILD=$(echo $STARLINUX_BUILD)/" $WORK_DIR/starinit/starinit/lib/starinit.lib
sed -i "22s/.*/CODENAME=$(echo $CODENAME)/" $WORK_DIR/starinit/starinit/lib/starinit.lib
#sed -i "23s/.*/KERN_VERX=$(echo $KERN_VERX)/" $WORK_DIR/starinit/starinit/lib/starinit.lib
message done "Configured StarINIT."
echo -e "${GN}StarINIT has been prepared.${NC}"