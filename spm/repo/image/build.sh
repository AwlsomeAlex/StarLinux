#!/bin/bash
################################
#------------------------------#
# Star Package Manager - Image #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: vGIT
# Last Build: 5/6/18 11:50am EST
# Build Status: TESTING....
# Identifier: AwlsomeAlex

#---- Variables ----#
STARINIT_VER="1.3.2"
SEEK="2048"
MNT_DIR="/mnt/StarLinux"

#---- Executable ----#
#echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!{NC}"
depends Nebula
depends initramfs
message .... "Creating StarLinux Image...."
mkdir -p $WORK_DIR/image
dd if=/dev/null of=$WORK_DIR/image/StarLinux-$KERN_VER.img bs=1M seek=$SEEK
message done "Created StarLinux Image."
message .... "Formatting Image."
message warning "THIS REQUIRES SUPERUSER PERMISSION!"
sudo mkfs.ext4 -F $WORK_DIR/image/StarLinux-$KERN_VER.img
message done "Formatted Image."
message .... "Populating Image...."
message warning "THIS REQUIRES SUPERUSER PERMISSION!"
sudo mkdir $MNT_DIR
sudo mount -t ext4 -o loop $WORK_DIR/image/StarLinux-$KERN_VER.img $MNT_DIR
sudo cp -r $FINAL_DIR/filesystem/* $MNT_DIR
sudo sync
sudo umount $MNT_DIR
message done "Populated Image."
cp -r $WORK_DIR/image/StarLinux-$KERN_VER.img $FINAL_DIR/StarLinux-$KERN_VER.img
echo -e "${GN} StarLinux Image has been prepared.${NC}"
