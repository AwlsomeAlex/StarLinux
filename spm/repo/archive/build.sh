#!/bin/bash
##################################
#--------------------------------#
# Star Package Manager - Archive #
#--------------------------------#
##################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: GIT
# Last Build: NONE
# Build Status: NONE
# Identifier: AwlsomeAlex

#---- Variables ----#
KERN_VER="4.14.35" # !!!Temporary Versioning System!!! #
STARINIT_DIR="$WORK_DIR/starinit/starinit"

#---- Executable ----#
depends Nebula
depends linux
depends starinit
