#!/bin/bash

################################
# StarLinux Kernel Packer Tool #
#------------------------------#
#Created by AwlsomeAlex {GPLv3}#
################################
# The main intention of this is#
#to automatically compile the  #
#  latest Linux Kernel for Star#
#Linux on my Server!           #
################################

JOB_FACTOR=1
NUM_CORES=$(grep ^processor /proc/cpuinfo | wc -l)
NUM_JOBS=$((NUM_CORES * JOB_FACTOR))

logo() {
	clear
	echo ""
	echo "==========================="
	echo "| StarLinux Kernel Packer |"
	echo "|-------------------------|"
	echo "|Made by AwlsomeAlex GPLv3|"
	echo "==========================="
	echo ""
}

logo
echo "Please type a Kernel Version Branch:"
echo "Example: '4.10.9' for Linux Kernel 4.10.9"
read KERN_VER
clear
rm -rf /tmp/kern_packer
mkdir /tmp/kern_packer
mkdir /tmp/kern_packer/final
mkdir /tmp/kern_packer/final/lib
mkdir /tmp/kern_packer/final/lib/modules
mkdir /tmp/kern_packer/final/lib/firmware
cd /tmp/kern_packer
DOWNLOAD_URL=http://kernel.org/pub/linux/kernel/v4.x/linux-$KERN_VER.tar.xz
ARCHIVE_FILE=${DOWNLOAD_URL##*/}
logo
echo "Downloading Linux Kernel Version $KERN_VER..."
sleep 3
wget $DOWNLOAD_URL -q --show-progress
if [ ! -f $ARCHIVE_FILE ]; then
	echo "Unknown Linux Kernel Version. Please Try Again!"
	exit 0
fi
logo
echo "Extracting Linux Kernel Version $KERN_VER..."
sleep 3
tar -xvf $ARCHIVE_FILE -C .
cd $(ls -d linux-*)
logo
echo "Configuring Linux Kernel Version $KERN_VER..."
sleep 3
make mrproper -j $NUM_JOBS
make defconfig -j $NUM_JOBS
sed -i "s/.*CONFIG_DEFAULT_HOSTNAME.*/CONFIG_DEFAULT_HOSTNAME=\"awlsomelinux\"/" .config
sed -i "s/.*\\(CONFIG_KERNEL_.*\\)=y/\\#\\ \\1 is not set/" .config 
sed -i "s/.*CONFIG_KERNEL_XZ.*/CONFIG_KERNEL_XZ=y/" .config
sed -i "s/.*CONFIG_OVERLAY_FS.*/CONFIG_OVERLAY_FS=y/" .config
sed -i "s/.*CONFIG_FB_VESA.*/CONFIG_FB_VESA=y/" .config
sed -i "s/.*CONFIG_LOGO_LINUX_CLUT224.*/CONFIG_LOGO_LINUX_CLUT224=y/" .config
sed -i "s/^CONFIG_DEBUG_KERNEL.*/\\# CONFIG_DEBUG_KERNEL is not set/" .config
sed -i "s/.*CONFIG_EFI_STUB.*/CONFIG_EFI_STUB=y/" .config
echo "CONFIG_EFI_MIXED=y" >> .config
logo
echo "Building Linux Kernel Version $KERN_VER..."
sleep 3
make \
	CFLAGS="-Os -s -fno-stack-protector -U_FORTIFY_SOURCE" \
	bzImage -j $NUM_JOBS
logo
echo "Installing Linux Kernel Version $KERN_VER..."
sleep 3
echo "Installing Linux Kernel..."
	cp arch/x86/boot/bzImage \
	/tmp/kern_packer/final/kernel-$KERN_VER.xz
logo
echo "Generating Linux Kernel Headers for Version $KERN_VER..."
sleep 3
make \
	INSTALL_HDR_PATH=/tmp/kern_packer/final \
	headers_install -j $NUM_JOBS
logo
echo "Generating Linux Kernel Modules for Version $KERN_VER..."
sleep 3
	make \
	modules -j $NUM_JOBS
logo
echo "Installing Linux Kernel Modules for Version $KERN_VER..."
sleep 3
make \
	INSTALL_MOD_PATH=/tmp/kern_packer/final/ \
	modules_install -j $NUM_JOBS
logo
echo "Generating Linux Kernel Firmware for Version $KERN_VER..."
sleep 3
make \
	INSTALL_FW_PATH=/tmp/kern_packer/final/lib/firmware \
	firmware_install -j $NUM_JOBS
logo
echo "Configuring Linux Kernel Modules for Version $KERN_VER..."
sleep 3
cd /tmp/kern_packer/final/lib/modules
cd $(ls)
unlink build
unlink source
cd /tmp/kern_packer/final
logo
echo "Packing Linux Kernel Version $KERN_VER..."
tar -czvf kernel-$KERN_VER.tar.gz *
cp kernel-$KERN_VER.tar.gz $HOME/Documents
cd $HOME/Documents
rm -rf /tmp/kern_packer/
