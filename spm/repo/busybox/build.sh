#!/bin/bash
##################################
#--------------------------------#
# Star Package Manager - BusyBox #
#--------------------------------#
##################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGit

. ../common.lib

#---- Build Info ----#
# Version Number: 1.28.3
# Last Build: 4/19/18 10:08 EST
# Build Status: PASS
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="http://busybox.net/downloads/busybox-1.28.3.tar.bz2"
BUSYBOX_VER="1.28.3"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

#---- Executable ----#
depends Nebula
message .... "Downloading and Extracting BusyBox...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE busybox
message done "Downloaded and Extracted BusyBox."
message .... "Configuring BusyBox...."
mkdir $WORK_DIR/busybox/busybox_final
cd $WORK_DIR/busybox/busybox-*
make distclean -j $NUM_JOBS
make defconfig -j $NUM_JOBS
sed -i "s/.*CONFIG_INETD.*/CONFIG_INETD=n/" .config
message done "Configured BusyBox."
message .... "Building BusyBox...."
make \
	EXTRA_CFLAGS="$CFLAGS" \
	busybox -j $NUM_JOBS
message done "Built BusyBox."
message .... "Preparing BusyBox...."
make \
	CONFIG_PREFIX="$WORK_DIR/busybox/busybox_final" \
	install -j $NUM_JOBS
message done "Prepared BusyBox."
echo -e "${GN}BusyBox $BUSYBOX_VER has been built.${NC}"
	
