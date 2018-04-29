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
# Version Number: GIT
# Last Build: 4/29/18 4:24pm EST
# Build Status: UNTESTED
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://github.com/AwlsomeAlex/starinit/archive/old.zip"
BUSYBOX_INSTALLED="$WORK_DIR/busybox/busybox_final"
GLIBC_FINAL="$WORK_DIR/glibc/glibc_final"
STARINIT="$WORK_DIR/starinit/starinit-old/src"
BUSYBOX_ARCH=$(file bin/busybox | cut -d' '  -f3)


#---- Executable ----#
depends Nebula
depends linux
depends glibc
depends busybox
message .... "Downloading and Extracting StarINIT...."
download $DOWNLOAD_LINK $SRC_DIR
unzip $SRC_DIR/master.zip -d $WORK_DIR/starinit/
mkdir -p $WORK_DIR/starinit/starinit
cp -r $WORK_DIR/starinit/starinit-old/src/* $WORK_DIR/starinit/starinit
message done "Downloaded and Extracted StarINIT."
echo -e "${GN}StarINIT has been downloaded.${NC}"
# BUGGY CODING
