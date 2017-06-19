#!/bin/bash

#############################
# StarLinux Builder Utility #
#---------------------------#
#  Created by AwlsomeAlex   #
#############################
# StarLinux Builder Tool is an
# automatic utility which will
# build the StarLinux Kernel
# and create the initramfs,
# along with the filesystem 
# which will be installed in
# the StarLinux Arch Installer
# Script. Licensed GNU GPLv3!


## Settings ##
JOB_FACTOR=1
NUM_CORES=$(grep ^processor /proc/cpuinfo | wc -l)
NUM_JOBS=$((NUM_CORES * JOB_FACTOR))
KERN_VER="Undefined"
GLIBC_VER="Undefined"
BUSYBOX_VER="Undefined"
KERN_STATUS="---"
GLIBC_STATUS="---"
BUSYBOX_STATUS="---"

## Functions ##
logo () {
	clear
	echo ""
	echo "============================="
	echo "| StarLinux Builder Utility |"
	echo "|---------------------------|"
	echo "| Made by AwlsomeAlex GPLv3 |"
	echo "============================="
	echo ""
}

menu () {
	echo ""
	echo "======================================"
	echo "| ($KERN_STATUS) Linux Kernel     | $KERN_VER     "
	echo "| ($GLIBC_STATUS) GlibC Library    | $GLIBC_VER    "
	echo "| ($BUSYBOX_STATUS) BusyBox Userland | $BUSYBOX_VER  "
	echo "======================================"
	echo ""
}

sb_exit () {
	logo
	echo "StarBuilder will now exit."
	echo "Thank you for using StarBuilder!"
	echo "Created by AwlsomeAlex [GNU GPLv3]"
	exit
	
}

check_packages() {
		logo
		echo "NOTICE: Starbuilder will now download/update any required packages needed to compile. [THIS WILL REQUIRE ROOT/SUDO ACCESS!]"
		echo ""
		echo "Please select your Distribution:"
		echo "1.) Ubuntu 16.04+"
		echo "2.) Debian 8.x"
		echo "3.) Fedora 24+"
		echo "4.) ArchLinux"
		echo ""
		read DISTRO
			if [ $DISTRO == 1 ]; then
				logo
				echo "Requesting Root/Sudo Rights for APT..."
				sleep 3
				sudo apt-get update
				sudo apt-get install -y build-essential wget make gawk gcc bc syslinux genisoimage texinfo bison
				logo
				echo "Required packages have been installed. Continuing..."
				sleep 3
				make_dir
			elif [ $DISTRO == 2 ]; then
				logo
				echo "This distribution is untested with StarBuilder. Please install the packages manually and proceed with caution..."
				sleep 3
				make_dir
			elif [ $DISTRO == 3 ]; then
				logo
				echo "This distribution is untested with StarBuilder. Please install the packages manually and proceed with caution..."
				sleep 3
				make_dir
			elif [ $DISTRO == 4 ]; then
				logo
				echo "This distribution is untested with StarBuilder. Please install the packages manually and proceed with caution..."
				sleep 3
				make_dir
			else
				logo
				echo "Invalid Option. Please choose again!"
				return 0
			fi
}

make_dir () {
	if [ -d /tmp/starbuilder ]; then
		logo
		echo "WARNING! The StarBuilder Directory has already been created. What action should be taken?"
		echo ""
		echo "1.) Overwrite Current StarBuilder Directory."
		echo "2.) Rename Current StarBuilder Directory."
		echo "3.) Cancel StarBuilder Completely."
		echo ""
		read DIR_OPTION
			if [ $DIR_OPTION == 1 ]; then
				logo
				echo "Overwritting Current StarBuilder Directory..."
				rm -rf /tmp/starbuilder
				echo "StarBuilder Directory Overwritten."
			elif [ $DIR_OPTION == 2 ]; then
				logo
				echo "Renaming Current StarBuilder Directory..."
				mv /tmp/starbuilder /tmp/starbuilder_$$
				rm -rf /tmp/starbuilder
				echo "StarBuilder Directory Overwritten."
			elif [ $DIR_OPTION == 3 ]; then
				sb_exit
			else
				logo
				echo "Invalid Option. Please choose again!"
				return 0
			fi
	fi
	logo
	echo "Creating Essential StarBuilder Directories..."
	mkdir /tmp/starbuilder
	mkdir -p /tmp/starbuilder/{Source,Work/Image,Image}
	echo "StarBuilder Directories Created."
	define_version
}

define_version () {
	if [ $KERN_VER == "Undefined" ]; then
		logo
		menu
		echo "A Kernel Version has not been defined. Please define a Kernel Version: [NOTE: Please don't go beyond 4.9.x!]" # Can't go beyond due to a configuration error with Linux Kernel 4.10 and up. [TEMP FIX]
		read KERN_VER
		KERN_STATUS="#--"
		define_version
	fi
	if [ $GLIBC_VER == "Undefined" ]; then
		logo
		menu
		echo "A GNU Library C Version has not been defined. Please define a GlibC Version:"
		read GLIBC_VER
		GLIBC_STATUS="#--"
		define_version
	fi
	if [ $BUSYBOX_VER == "Undefined" ]; then
		logo
		menu
		echo "A Busybox Version has not been defined. Please define a Busybox Version:"
		read BUSYBOX_VER
		BUSYBOX_STATUS="#--"
		define_version
	fi
	logo
	menu
	echo "Do these versions look correct?"
	echo "WARNING: Any incorrect version number will cause the builder to fail and StarLinux to be messed up!"
	echo ""
	echo "1.) No, Change Kernel Version."
	echo "2.) No, Change GlibC Version."
	echo "3.) No, Change Busybox Version."
	echo "4.) Yes, continue!"
	read DEFINE_OPTION
	if [ $DEFINE_OPTION == "1" ]; then
		KERN_VER="Undefined"
		KERN_STATUS="---"
		define_version
	elif [ $DEFINE_OPTION == "2" ]; then
		GLIBC_VER="Undefined"
		GLIBC_STATUS="---"
		define_version
	elif [ $DEFINE_OPTION == "3" ]; then
		BUSYBOX_VER="Undefined"
		BUSYBOX_STATUS="---"
		define_version
	elif [ $DEFINE_OPTION == "4" ]; then
		download_packages
	else
		logo
		echo "Invalid Option! Exitting..."
		exit 0
	fi
}

download_packages () {
	cd /tmp/starbuilder/Source
	logo
	echo "Downloading Linux Kernel $KERN_VER..."
	wget http://kernel.org/pub/linux/kernel/v4.x/linux-$KERN_VER.tar.xz -q --show-progress
	KERN_STATUS="##-"
	echo ""
	echo "Downloading GNU C Library $GLIBC_VER..."
	wget http://ftp.gnu.org/gnu/glibc/glibc-$GLIBC_VER.tar.bz2 -q --show-progress
	GLIBC_STATUS="##-"
	echo ""
	echo "Downloading Busybox $BUSYBOX_VER..."
	wget https://busybox.net/downloads/busybox-$BUSYBOX_VER.tar.bz2 -q --show-progress
	BUSYBOX_STATUS="##-"
	echo ""
	echo "Downloading Syslinux 6.03..."
	wget http://kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz -q --show-progress
	logo
	echo "Downloading StarLinux starinit Boot Scripts..."
	wget https://github.com/AwlsomeAlex/starinit/archive/master.zip -q --show-progress
	extract_packages
}

extract_packages () {
	cd /tmp/starbuilder/Work
	logo
	menu
	echo "Extracting Linux Kernel $KERN_VER..."
	sleep 3
	tar -xvf ../Source/linux-$KERN_VER.tar.xz -C .
	KERN_STATUS="###"
	logo
	menu
	echo "Extracting GNU C Library $GLIBC_VER..."
	sleep 3
	tar -xvf ../Source/glibc-$GLIBC_VER.tar.bz2 -C .
	GLIBC_STATUS="###"
	logo
	menu
	echo "Extracting Busybox $BUSYBOX_VER..."
	sleep 3
	tar -xvf ../Source/busybox-$BUSYBOX_VER.tar.bz2 -C .
	BUSYBOX_STATUS="###"
	logo
	menu
	echo "Extracting Syslinux 6.03..."
	sleep 3
	tar -xvf ../Source/syslinux-6.03.tar.xz -C .
	logo
	menu
	echo "Extracting starinit..."
	sleep 3
	unzip ../Source/master.zip -d .
	kernel_build
}

kernel_build () {
	cd /tmp/starbuilder/Work/linux-$KERN_VER
	KERN_STATUS="CFG"
	logo
	menu
	echo "Configuring Linux Kernel $KERN_VER..."
	sleep 3
	make mrproper -j $NUM_JOBS
	make defconfig -j $NUM_JOBS
	sed -i "s/.*CONFIG_DEFAULT_HOSTNAME.*/CONFIG_DEFAULT_HOSTNAME=\"starlinux\"/" .config
	sed -i "s/.*\\(CONFIG_KERNEL_.*\\)=y/\\#\\ \\1 is not set/" .config 
	sed -i "s/.*CONFIG_KERNEL_XZ.*/CONFIG_KERNEL_XZ=y/" .config
	sed -i "s/.*CONFIG_OVERLAY_FS.*/CONFIG_OVERLAY_FS=y/" .config
	sed -i "s/.*CONFIG_FB_VESA.*/CONFIG_FB_VESA=y/" .config
	sed -i "s/.*CONFIG_LOGO_LINUX_CLUT224.*/CONFIG_LOGO_LINUX_CLUT224=y/" .config
	sed -i "s/^CONFIG_DEBUG_KERNEL.*/\\# CONFIG_DEBUG_KERNEL is not set/" .config
	sed -i "s/.*CONFIG_EFI_STUB.*/CONFIG_EFI_STUB=y/" .config
	echo "CONFIG_EFI_MIXED=y" >> .config
	mkdir /tmp/starbuilder/Work/linux_extra
	mkdir /tmp/starbuilder/Work/linux_extra/lib
	mkdir /tmp/starbuilder/Work/linux_extra/lib/firmware
	KERN_STATUS="BLD"
	logo
	menu
	echo "Building Linux Kernel $KERN_VER..."
	sleep 3
	make \
		CFLAGS="-Os -s -fno-stack-protector -U_FORTIFY_SOURCE" \
		bzImage -j $NUM_JOBS
	KERN_STATUS="INS"
	logo
	menu
	echo "Installing Linux Kernel $KERN_VER..."
	sleep 3
	cp arch/x86/boot/bzImage \
		/tmp/starbuilder/Image/kernel-$KERN_VER.xz
	KERN_STATUS="HDR"
	logo
	menu
	echo "Generating Linux Kernel Headers $KERN_VER..."
	sleep 3
	make \
		INSTALL_HDR_PATH=/tmp/starbuilder/Work/linux_extra \
		headers_install -j $NUM_JOBS
	KERN_STATUS="MOD"
	logo
	menu
	echo "Generating Linux Kernel Modules $KERN_VER..."
	sleep 3
	make \
		modules -j $NUM_JOBS
	logo
	menu
	echo "Installing Linux Kernel Modules $KERN_VER..."
	sleep 3
	make \
		INSTALL_MOD_PATH=/tmp/starbuilder/Work/linux_extra \
		modules_install -j $NUM_JOBS
	KERN_STATUS="FRM"
	logo
	menu
	echo "Generating Linux Kernel Firmware $KERN_VER..."
	sleep 3
	make \
		INSTALL_FW_PATH=/tmp/starbuilder/Work/linux_extra/lib/firmware \
		firmware_install -j $NUM_JOBS
	KERN_STATUS="MOD"
	logo
	menu
	echo "Configuring Linux Kernel Modules $KERN_VER..."
	cd /tmp/starbuilder/Work/linux_extra/lib/modules
	cd $(ls)
	unlink build
	unlink source
	cd /tmp/starbuilder/Work
	KERN_STATUS="BLT"
	logo
	menu
	echo "Linux Kernel $KERN_VER has been successfully built!"
	glibc_build
}

glibc_build () {
	cd /tmp/starbuilder/Work/glibc-$GLIBC_VER
	GLIBC_STATUS="CFG"
	logo
	menu
	echo "Configuring GNU C Library $GLIBC_VER..."
	sleep 3
	mkdir /tmp/starbuilder/Work/glibc_objects
	mkdir /tmp/starbuilder/Work/glibc
	GLIBC_SRC=$(pwd)
	KERN_INSTALLED=/tmp/starbuilder/Work/linux_extra
	GLIBC_INSTALLED=/tmp/starbuilder/Work/glibc
	cd /tmp/starbuilder/Work/glibc_objects
	$GLIBC_SRC/configure \
		--prefix= \
		--with-headers=$KERN_INSTALLED/include \
		--without-gd \
		--without-selinux \
		--disable-werror \
		CFLAGS="-Os -s -fno-stack-protector -U_FORTIFY_SOURCE"
	GLIBC_STATUS="BLD"
	logo
	menu
	echo "Building GNU C Library $GLIBC_VER..."
	sleep 3
	make -j $NUM_JOBS
	GLIBC_STATUS="INS"
	logo
	menu
	echo "Installing GNU C Library $GLIBC_VER..."
	sleep 3
	make install \
		DESTDIR=$GLIBC_INSTALLED \
		-j $NUM_JOBS
	GLIBC_STATUS="PRE"
	logo
	menu
	echo "Preparing GNU C Library $GLIBC_VER..."
	sleep 3
	cd /tmp/starbuilder/Work
	cp -r glibc glibc_final
	cd glibc_final
	GLIBC_FINAL=$(pwd)
	mkdir -p usr
	cd usr
	ln -s ../include include
	ln -s ../lib lib
	cd ../include
	ln -s $KERN_INSTALLED/include/linux linux
	ln -s $KERN_INSTALLED/include/asm asm
	ln -s $KERN_INSTALLED/include/asm-generic asm-generic
	ln -s $KERN_INSTALLED/include/mtd mtd
	cd /tmp/starbuilder/Work
	GLIBC_STATUS="BLT"
	logo
	menu
	echo "GNU C Library $GLIBC_VER has been successfully built!"
	busybox_build
}

busybox_build () {
	cd /tmp/starbuilder/Work/busybox-$BUSYBOX_VER
	BUSYBOX_STATUS="CFG"
	logo
	menu
	echo "Configuring Busybox Userland $BUSYBOX_VER..."
	sleep 3
	mkdir /tmp/starbuilder/Work/busybox_final
	make distclean -j $NUM_JOBS
	make defconfig -j $NUM_JOBS
	sed -i "s/.*CONFIG_INETD.*/CONFIG_INETD=n/" .config
	BUSYBOX_STATUS="BLD"
	logo
	menu
	echo "Building Busybox Userland $BUSYBOX_VER..."
	sleep 3
	make \
		EXTRA_CFLAGS="-Os -s -fno-stack-protector -U_FORTIFY_SOURCE" \
		busybox -j $NUM_JOBS
	BUSYBOX_STATUS="INS"
	logo
	menu
	echo "Installing Busybox Userland $BUSYBOX_VER..."
	make \
		CONFIG_PREFIX="/tmp/starbuilder/Work/busybox_final" \
		install -j $NUM_JOBS
	BUSYBOX_INSTALLED=/tmp/starbuilder/Work/busybox_final
	BUSYBOX_STATUS="BLT"
	logo
	menu
	echo "Busybox Userland $BUSYBOX_VER has been successfully built!"
	generate_initramfs
}

generate_initramfs () {
	logo
	menu
	echo "Setting up InitramFS Environment..."
	sleep 3
	cd /tmp/starbuilder/Work/Image
	cp -r $BUSYBOX_INSTALLED initramfs
	cp -r /tmp/starbuilder/Work/starinit-master/src/* initramfs
	cd initramfs
	rm -f linuxrc
	logo
	menu
	echo "Copying Required InitramFS Libraries..."
	sleep 3
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
	cp $GLIBC_FIANL/lib/libnss_dns.so.2 lib
	cp -r /tmp/starbuilder/Work/linux_extra/lib/* lib
	strip -g \
		/tmp/starbuilder/Work/Image/initramfs/bin/* \
		/tmp/starbuilder/Work/Image/initramfs/sbin/* \
		/tmp/starbuilder/Work/Image/initramfs/lib/* \
		2>/dev/null
	logo
	menu
	echo "InitramFS Environment Configured!"
	pack_initramfs
}

pack_initramfs () {
	logo
	menu
	echo "Packing InitramFS Environment..."
	sleep 3
	cd /tmp/starbuilder/Work/Image/initramfs
	find . | cpio -R root:root -H newc -o | xz -9 --check=none > ../initramfs-$KERN_VER.cpio.xz
	echo "InitramFS has been successfully packed!"
	exit 1
}

check_packages
