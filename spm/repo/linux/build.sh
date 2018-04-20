#!/bin/bash
################################
#------------------------------#
# Star Package Manager - Linux #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: 4.14.35
# Last Build: 4/19/18 10:40 EST
# Build Status: TESTING....
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.35.tar.xz"
KERNEL="basic" # There are three types of Kernels: 'mini' which only includes the bare bones functionality; 'basic' which includes SOME drivers like netwoking and FS; 'heavy' which includes MOST drivers and other optional features.
KERN_VER="4.14.35"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

#---- Executable ----#
depends Nebula
message .... "Downloading and Extracting Linux Kernel...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE linux
message done "Downloaded and Extracted Linux Kernel."
message .... "Building Linux Kernel...."
cd $WORK_DIR/linux/linux-*
mkdir -p $WORK_DIR/linux/linux_extra/lib/firmware #Might need updating
cp $REPO_DIR/linux/mini.config $WORK_DIR/linux/linux-$KERN_VER/.config
make \
	CFLAGS="$CFLAGS" \
	bzImage -j $NUM_JOBS
cp arch/x86/boot/bzImage \
	$FINAL_DIR/kernel-$KERN_VER.xz
message done "Built Linux Kernel."
message .... "Building Linux Kernel Headers...."
make \
	INSTALL_HDR_PATH=$WORK_DIR/linux/linux_extra \
	headers_install -j $NUM_JOBS
message done "Built Linux Kernel Headers."
message .... "Building Linux Kernel Modules...."
make \
	modules -j $NUM_JOBS
make \
	INSTALL_MOD_PATH=$WORK_DIR/linux/linux_extra \
	modules_install -j $NUM_JOBS
message done "Built Linux Kernel Modules."
#message .... "Building Linux Kernel Firmware...."
#make \
#	INSTALL_FW_PATH=$WORK_DIR/linux/linux_extra/lib/firmware \
#	firmware_install -j $NUM_JOBS
#message done "Built Linux Kernel Firmware."
message .... "Configuring Linux Kernel Modules...."
cd $WORK_DIR/linux/linux_extra/lib/modules
cd $(ls)
unlink build
unlink source
message done "Configured Linux Kernel Modules."
echo -e "${GN}Linux Kernel $KERN_VER has been built.${NC}"
