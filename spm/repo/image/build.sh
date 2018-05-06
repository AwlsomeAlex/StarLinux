#!/bin/bash
################################
#------------------------------#
# Star Package Manager - Image #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGit

. ../common.lib

#---- Build Info ----#
# Version Number: vGI
# Last Build: 5/6/18 4:36pm EST
# Build Status: TESTED
# Identifier: AwlsomeAlex

#---- Variables ----#
STARINIT_VER="1.3.3"
COUNT="12" # 12 creates 24MB Disk Image / Doubled Number
MNT_DIR="/mnt/StarLinux"

#---- Executable ----#
#echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!{NC}"
depends Nebula
depends initramfs
message .... "Creating StarLinux Image...."
mkdir -p $WORK_DIR/image
dd if=/dev/zero bs=2M count=$COUNT > $WORK_DIR/image/StarLinux-$KERN_VER.img
message done "Created StarLinux Image."
message .... "Formatting Image...."
message warning "THIS REQUIRES SUPERUSER PERMISSION!"
echo -e "n\np\n\n\n\nw" | fdisk $WORK_DIR/image/StarLinux-$KERN_VER.img 
LOOP=$(sudo losetup --partscan --show --find $WORK_DIR/image/StarLinux-$KERN_VER.img)
LOOPP1="${LOOP}p1"
sudo mkfs -t ext4 -L StarLinux $LOOPP1
message done "Formatted Image."
message .... "Populating Image...."
message warning "THIS REQUIRES SUPERUSER PERMISSION!"
mkdir -p $MNT_DIR
sudo mount $LOOPP1 $MNT_DIR
sudo cp -r $FINAL_DIR/filesystem/* $MNT_DIR
sudo sync
sudo umount $MNT_DIR
sudo losetup -d $LOOP
message done "Populated Image"
cp -r $WORK_DIR/image/StarLinux-$KERN_VER.img $FINAL_DIR/StarLinux-$KERN_VER.img
rm -rf $FINAL_DIR/filesystem
echo -e "${GN}StarLinux Image has been prepared.${NC}"
