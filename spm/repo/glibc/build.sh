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
# Last Build: NONE
# Build Status: NONE
# Identifier: AwlsomeAlex

#---- Variables ----#
DOWNLOAD_LINK="https://mirror.us-midwest-1.nexcess.net/gnu/libc/glibc-2.27.tar.bz2"
KERN_VER="2.27"
ARCHIVE_FILE=${DOWNLOAD_LINK##*/}

#---- Executable ----#
depends Nebula
depends linux
message .... "Downloading and Extracting GlibC...."
download $DOWNLOAD_LINK $SRC_DIR
extract $SRC_DIR/$ARCHIVE_FILE glibc
message done "Downloaded and Extracted GlibC."
message .... "Building GlibC..."
