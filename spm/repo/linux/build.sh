#!/bin/bash
################################
#                              #
# Star Package Manager - Linux #
#                              #
################################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

. ../common.lib

DOWNLOAD_LINK="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.18.tar.xz"
KERNEL="basic" # OPTIONS: 'skinny_ergo' - Bare Minimum for Kernel Compile ||| 'basic' - Basic Networking/FS Support ||| 'big_body' - Everything I feel should be included in a Linux Kernel ||| 'custom' - Customly dropped in 'custom.config' to be built.     CURRENT SUPPORTED KERNEL: v4.14.x LTS
PACKAGE="linux"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

dependent nebula
download_msg
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE $PACKAGE
download_done_msg
pause 3
build_msg

