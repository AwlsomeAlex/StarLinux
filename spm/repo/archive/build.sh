#!/bin/bash
##################################
#--------------------------------#
# Star Package Manager - Archive #
#--------------------------------#
##################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: vGIT
# Last Build: TESTING....
# Build Status: NONE
# Identifier: AwlsomeAlex

#---- Variables ----#
KERN_VER="4.14.35" # !!!Temporary Versioning System!!! #
STARINIT_DIR="$WORK_DIR/starinit/starinit"
ARCHIVE_DIR="$FINAL_DIR/archive/archive"
INITRAMFS_DIR="$WORK_DIR/initramfs/initramfs"


#---- Executable ----#
depends Nebula
depends initramfs
message .... "Preparing StarLinux Archive...."
mkdir -p $ARCHIVE_DIR
cd $ARCHIVE_DIR
cp -r $FINAL_DIR/filesystem .
cp $FINAL_DIR/initramfs-$KERN_VER.xz .
cp $FINAL_DIR/kernel-$KERN_VER.xz .
message done "Prepared StarLinux Archive."
message .... "Packaging StarLinux Archive...."
cd ..
tar -zcvf StarLinux-$KERN_VER.tar.gz archive/*
md5sum StarLinux-$KERN_VER.tar.gz > StarLinux-$KERN_VER.md5
md5sum -c StarLinux-$KERN_VER.md5
message done "Packaged StarLinux Archive."
echo -e "${GN}StarLinux Archive $KERN_VER has been generated.${NC}"
exit 1
