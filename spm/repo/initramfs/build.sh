#!/bin/bash
####################################
#----------------------------------#
# Star Package Manager - InitramFS #
#----------------------------------#
####################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: vGIT
# Last Build: 4/25/18 10:44pm EST
# Build Status: TESTING....
# Identifier: AwlsomeAlex

#---- Variables ----#
#KERN_VER="" # !!!Temporary Versioning System!!! #
BUSYBOX_INSTALLED="$WORK_DIR/busybox/busybox_final"
GLIBC_FINAL="$WORK_DIR/glibc/glibc_final"
STARINIT_DIR="$WORK_DIR/starinit/starinit"
ARCHIVE_DIR="$FINAL_DIR/archive"
INITRAMFS_DIR="$WORK_DIR/initramfs/initramfs"


#---- Executable ----#
depends Nebula
depends linux
depends glibc
depends busybox
depends starinit
message .... "Preparing StarLinux InitramFS..."
mkdir -p $INITRAMFS_DIR
cp -r $BUSYBOX_INSTALLED/* $INITRAMFS_DIR
cp -r $STARINIT_DIR/* $INITRAMFS_DIR
cd $INITRAMFS_DIR
rm -f linuxrc
BUSYBOX_ARCH=$(file bin/busybox | cut -d' '  -f3)
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
	$INITRAMFS_DIR/bin/* \
	$INITRAMFS_DIR/sbin/* \
	$INITRAMFS_DIR/lib/* \
	2>/dev/null
message done "Prepared StarLinux InitramFS."
message .... "Packaging StarLinux InitramFS...."
cd $INITRAMFS_DIR
find . | cpio -R root:root -H newc -o | xz -9 --check=none > ../initramfs-$KERN_VER.cpio.xz
cp ../initramfs-$KERN_VER.cpio.xz $FINAL_DIR/initramfs-$KERN_VER.xz
mkdir -p $FINAL_DIR/filesystem
cp -r $INITRAMFS_DIR/* $FINAL_DIR/filesystem
message done "Packaged StarLinux InitramFS."
echo -e "${GN}StarLinux InitramFS $KERN_VER has been packaged.${NC}"
