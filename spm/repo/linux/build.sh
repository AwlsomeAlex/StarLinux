#!/bin/bash
################################
#------------------------------#
# Star Package Manager - Linux #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Variables ----#
DOWNLOAD_LINK="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.18.tar.xz"
KERNEL="basic"
PACKAGE="linux"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

depends Nebula
message download 
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE $WORK_DIR/$PACKAGE
message download_done
message build
