#!/bin/bash
#################################
#                               #
# Star Package Manager - Nebula #
#                               #
#################################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

. ../common.lib

if [ -d $STAR_DIR ]; then
	echo -e "${RD} WARNING:${NC} A Nebula Directory has been detected at '$STAR_DIR'. It will now be deleted. Please exit the script to cancel this." #Option Menu TO-BE-ADDED
	rm -rf $STAR_DIR
fi
mkdir -p $STAR_DIR/{source,work,final}
if [ ! -d $REPO_DIR ]; then
	echo -e "${RD}WARNING:${NC} The Repository Folder could not be found at '$REPO_DIR'. This will cause future problems!"
	exit 0
fi
if [ -d $STAR_DIR ]; then
	echo -e "${GN}DONE:${NC} The Nebula Directories have been created! Ready for Packages to be build with 'spm build PACKAGE'!"
	exit 1
else
	echo -e "${RD}ERROR:${NC} The Nebula Directory could not be found. Possibly a Permissions or File Space problem?"
	exit 0
fi
