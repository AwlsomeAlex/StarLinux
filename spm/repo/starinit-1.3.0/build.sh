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
# Version Number: 1.3.0
# Last Build: NONE
# Build Status: BUILDING....
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://github.com/AwlsomeAlex/starinit/archive/master.zip"
BUSYBOX_INSTALLED="$WORK_DIR/busybox/busybox_final"
GLIBC_FINAL="$WORK_DIR/glibc/glibc_final"
STARINIT="$WORK_DIR/starinit/starinit-master/src"
BUSYBOX_ARCH=$(file bin/busybox | cut -d' '  -f3)


#---- Executable ----#
echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!"
#depends Nebula
#depends linux
#depends glibc
#depends busybox
#message .... "Downloading and Extracting StarINIT...."
#download $DOWNLOAD_LINK $SRC_DIR
#unzip $SRC_DIR/master.zip -d $WORK_DIR/starinit/
#mkdir -p $WORK_DIR/starinit/starinit
#cp -r $WORK_DIR/starinit/starinit-master/src/* $WORK_DIR/starinit/starinit
#message done "Downloaded and Extracted StarINIT."
#echo -e "${GN}StarINIT has been downloaded.${NC}"
# BUGGY CODING
