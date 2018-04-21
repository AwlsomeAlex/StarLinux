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
# Version Number: GIT
# Last Build: NONE
# Build Status: NONE
# Identifier: AwlsomeAlex

#---- Variables ----#
KERN_VER="4.14.35" # !!!Temporary Versioning System!!! #
STARINIT_DIR="$WORK_DIR/starinit/starinit"
ARCHIVE_DIR="$FINAL_DIR/archive"

#---- Executable ----#
depends Nebula
depends linux
depends starinit
echo -e "${RD} PACKAGE IS INCOMPLETE! PLEASE TRY AGAIN LATER!"
exit 1
#message .... "Packaging Current StarLinux Directory...."
#mkdir $FINAL_DIR/archive
#cd $STARINIT_DIR
#find . | cpio -R root:root -H newc -o | xz -9 --check=none > ../initramfs-$KERN_VER.cpio.xz
#cp ../initramfs-$KERN_VER.cpio.xz $ARCHIVE_DIR
