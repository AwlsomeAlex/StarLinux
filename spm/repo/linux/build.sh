
#!/bin/bash
################################
#------------------------------#
# Star Package Manager - Linux #
#------------------------------#
################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: None
# Last Build: None
# Build Status: None
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.18.tar.xz"
KERNEL="basic" # There are three types of Kernels: 'mini' which only includes the bare bones functionality; 'basic' which includes SOME drivers like netwoking and FS; 'heavy' which includes MOST drivers and other optional features.
PACKAGE="linux"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

#---- Executable ----#
depends Nebula
message download 
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE $WORK_DIR/$PACKAGE
message download_done
message build
