#!/bin/bash

##################################
# StarLinux InitramFS Maker Tool #
#--------------------------------#
#Created by AwlsomeAlex {GPLv3}  #
##################################
# The main intention for this tool
# is to use the precompiled linux
# kernels and make an initramfs
# in accordance to them and provide
# a script which will help configure
# SysLinux Bootloader.

JOB_FACTOR=1
NUM_CORES=$(grep ^processor /proc/cpuinfo | wc -l)
NUM_JOBS=$((NUM_CORES * JOB_FACTOR))

logo() {
	clear
	echo ""
	echo "============================="
	echo "| StarLinux InitramFS Maker |"
	echo "|---------------------------|"
	echo "| Made by AwlsomeAlex GPLv3 |"
	echo "============================="
	echo ""
}

logo
echo "Please type a GlibC Version Branch:"
echo "Example: '2.25' for GlibC 2.25"
read GLIBC_VER
clear
logo
echo "Please type a BusyBox Version Branch:"
echo "Example: '1.26.2' for BusyBox 1.26.2"
read BUSYBOX_VER
clear
rm -rf /tmp/initramfs_maker
mkdir /tmp/initramfs_maker
mkdir /tmp/initramfs_maker/src
mkdir /tmp/initramfs_maker/filesystem
cd /tmp/initramfs_maker
GLIBC_DOWNLOAD_URL=http://ftp.gnu.org/gnu/glibc/glibc-$GLIBC_VER.tar.bz2
GLIBC_ARCHIVE_FILE=${GLIBC_DOWNLOAD_URL##*/}
logo
echo "Downloading Linux Kernel Version $KERN_VER..."
sleep 3
wget $DOWNLOAD_URL -q --show-progress
if [ ! -f $ARCHIVE_FILE ]; then
	echo "Incorrect Linux Kernel Version. Please Try Again!"
	exit 0
fi