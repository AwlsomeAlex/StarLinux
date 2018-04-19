#!/bin/bash
#################################
#-------------------------------#
# Star Package Manager - Nebula #
#-------------------------------#
#################################
# Created by AwlsomeAlex [GNU GPLv3]
# Compatible with SPM vGIT

. ../common.lib

#---- Build Info ----#
# Version Number: GIT
# Last Build: 4/16/18
# Build Status: PASS
# Identifier: AwlsomeAlex

#---- Executable ----#
if [ -d $STAR_DIR ]; then
	message warning "A Nebula Directory has been detected at '$STAR_DIR' Would you like to delete this [Y or N]?"
	read TF
	if [[ $TF == "Y" ]]; then
		message .... "Deleting Nebula Directories...."
		rm -rf $STAR_DIR
		message done "Deleted Nebula Directories."
	else
		exit 1
	fi
fi
message .... "Creating Nebula Directories...."
mkdir -p $STAR_DIR/{source,work,final}
if [ ! -d $REPO_DIR ]; then
	message warning "The SPM Repository could not be found at '$REPO_DIR'. Please run 'spm update' or THIS WILL CAUSE PROBLEMS!"
	exit 1
fi
if [ -d $STAR_DIR ]; then
	message done "Created Nebula Directories. Ready for packages to be built with 'spm build PACKAGE' then create image with 'spm build image'."
else
	message error "The Nebula Directories could not be found. Possibly a Permissions or File Space problem?"
	exit 1
fi
