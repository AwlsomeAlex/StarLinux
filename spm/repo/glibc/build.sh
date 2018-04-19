#!/bin/bash
################################
#------------------------------#
# Star Package Manager - GlibC #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: 2.27
# Last Build: 4/18/18 11:14pm EST
# Build Status: PASS
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://mirror.us-midwest-1.nexcess.net/gnu/libc/glibc-2.27.tar.bz2"
GLIBC_VER="2.27"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}
GLIBC_SRC="$WORK_DIR/glibc/glibc-$GLIBC_VER"
GLIBC_INSTALLED="$WORK_DIR/glibc/glibc"
KERN_INSTALLED="$WORK_DIR/linux/linux_extra"

#---- Executable ----#
depends Nebula
depends linux
message .... "Downloading and Extracting GlibC...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE glibc
message done "Downloaded and Extracted GlibC."
message .... "Configuring GlibC..."
mkdir $WORK_DIR/glibc/glibc
mkdir $WORK_DIR/glibc/glibc_objects
$GLIBC_SRC/configure \
	--prefix= \
	--with-headers=$KERN_INSTALLED/include \
	--without-gd \
	--without-selinux \
	--disable-werror \
	CFLAGS="$CFLAGS"
message done "Configured GlibC."
message .... "Building GlibC...."
make -j $NUM_JOBS
make install \
	DESTDIR=$GLIBC_INSTALLED \
	-j $NUM_JOBS
message done "Built GlibC."
message .... "Preparing GlibC...."
cp -r $WORK_DIR/glibc/glibc $WORK_DIR/glibc/glibc_final
cd $WORK_DIR/glibc/glibc_final
mkdir -p usr
cd usr
ln -s ../include include
ln -s ../lib lib
cd ../include
ln -s $KERN_INSTALLED/include/linux linux
ln -s $KERN_INSTALLED/include/asm asm
ln -s $KERN_INSTALLED/include/asm-generic asm-generic
ln -s $KERN_INSTALLED/include/mtd mtd
message done "Prepared GlibC."
echo -e "${GN}GlibC $GLIBC_VER has been built.${NC}"
