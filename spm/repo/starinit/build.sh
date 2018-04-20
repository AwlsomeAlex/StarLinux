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
# Last Build: NONE
# Build Status: UNTESTED
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://github.com/AwlsomeAlex/starinit/archive/master.zip"
BUSYBOX_INSTALLED="$WORK_DIR/busybox/busybox_final"
GLIBC_FINAL="$WORK_DIR/glibc/glibc_final"
STARINIT="$WORK_DIR/starinit/starinit-master/src"
BUSYBOX_ARCH=$(file bin/busybox | cut -d' '  -f3)


#---- Executable ----#
depends Nebula
depends linux
depends glibc
depends busybox
message .... "Downloading and Extracting StarINIT...."
download $DOWNLOAD_LINK $SRC_DIR
unzip $SRC_DIR/master.zip -d $WORK_DIR/starinit/
message done "Downloaded and Extracted StarINIT."
message .... "Creating StarINIT Directories...."
mkdir -p $WORK_DIR/starinit/starinit
cp -r $BUSYBOX_INSTALLED $WORK_DIR/starinit/starinit
cp -r $STARINIT/* $WORK_DIR/starinit/starinit
cd $WORK_DIR/starinit/starinit
rm -f linuxrc
message done "Created StarINIT Directories."
message .... "Building StarINIT Directories...."
if [ "$BUSYBOX_ARCH" = "64-bit" ] ; then
	mkdir lib64
	cp $GLIBC_FINAL/lib/ld-linux* lib64
	echo "Configured for 64-bit Libraries."
else
	cp $GLIBC_FINAL/lib/ld-linux* lib
	echo "Configured for 32-bit Libraries."
fi
cp $GLIBC_FINAL/lib/libm.so.6 lib
cp $GLIBC_FINAL/lib/libc.so.6 lib
cp $GLIBC_FINAL/lib/libresolv.so.2 lib
cp $GLIBC_FINAL/lib/libnss_dns.so.2 lib
cp -r $WORK_DIR/linux/linux_extra/lib/* lib
strip -g \
	$WORK_DIR/starinit/starinit/bin/* \
	$WORK_DIR/starinit/starinit/sbin/* \
	$WORK_DIR/starinit/starinit/lib/* \
	2>/dev/null
message done "Built StarINIT Directories."
echo -e "${GN}StarINIT has been built.${NC}"
# BUGGY CODING
