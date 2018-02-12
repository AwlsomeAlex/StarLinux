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
PACKAGE="linux"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

check_for_star
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE $PACKAGE
