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
# Last Build: 5/6/18 11:50am EST
# Build Status: TESTING....
# Identifier: AwlsomeAlex

#---- Variables ----#
#KERN_VER="" # !!!Temporary Versioning System!!! #
STARINIT_DIR="$WORK_DIR/starinit/starinit"
ARCHIVE_DIR="$WORK_DIR/archive/archive"


#---- Executable ----#
depends Nebula
depends initramfs
message .... "Preparing StarLinux Archive...."
mkdir -p $ARCHIVE_DIR
cd $ARCHIVE_DIR
cp -r $FINAL_DIR/filesystem .
cp $FINAL_DIR/initramfs-$KERN_VER.xz .
cp $FINAL_DIR/kernel-$KERN_VER.xz .
if [ -f $FINAL_DIR/StarLinux-$KERN_VER.img ]; then
	echo "StarLinux Filesystem Image Detected."
	cp $FINAL_DIR/StarLinux-$KERN_VER.img .
fi
message done "Prepared StarLinux Archive."
message .... "Packaging StarLinux Archive...."
tar -zcvf $FINAL_DIR/StarLinux-$KERN_VER.tar.gz *
md5sum $FINAL_DIR/StarLinux-$KERN_VER.tar.gz > $FINAL_DIR/StarLinux-$KERN_VER.md5
md5sum -c $FINAL_DIR/StarLinux-$KERN_VER.md5
message done "Packaged StarLinux Archive."
echo -e "${GN}StarLinux Archive $KERN_VER has been generated.${NC}"
exit 1
