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
DOWNLOAD_LINK="https://github.com/AwlsomeAlex/starinit/archive/v1.3.0.tar.gz"
STARINIT_VER="1.3.0"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}
BUSYBOX_INSTALLED="$WORK_DIR/busybox/busybox_final"
GLIBC_FINAL="$WORK_DIR/glibc/glibc_final"
STARINIT="$WORK_DIR/starinit/starinit-master/src"
BUSYBOX_ARCH=$(file bin/busybox | cut -d' '  -f3)


#---- Executable ----#
#echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!${NC}"
#depends Nebula
#depends linux
#depends glibc
#depends busybox
message .... "Downloading and Extracting StarINIT...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE starinit
#mkdir -p $WORK_DIR/starinit/starinit
#cp -r $WORK_DIR/starinit/starinit-master/src/* $WORK_DIR/starinit/starinit
#message done "Downloaded and Extracted StarINIT."
#echo -e "${GN}StarINIT has been downloaded.${NC}"
# BUGGY CODING
