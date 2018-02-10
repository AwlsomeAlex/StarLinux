#!/bin/bash
# Star Package Manager Master Executable

###############################
#                             #
# Star Package Manager - Exec #
#                             #
###############################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

SPM_VER="GIT-20180210-003"
COMMAND="$1"
PACKAGE="$2"

### WARNING: When Running in Codenvy Use Command: `sed -i -e 's/\r$//' spm` to get rid of garbage!

#############################
# Connecting to the Library #
#############################
echo ""
echo "Star Package Manager Version $SPM_VER"
echo ""
if [ -d /etc/spm/ ]; then
    echo "Native StarOS Linux Distribution Detected."
    echo "Calling StarOS SPM Library..."
    . /lib/spm/staros.lib || echo "The Library could not be found!" && exit 1
    assurance
else
    echo "Non-Native Linux Distribution Detected."
    echo "Calling Linux SPM Library..."
    if [ -f linux.lib ]; then
        . ./linux.lib
        assurance
    else
        echo "The Library could not be found. Now Downloading..."
        update-lib-linux
    fi
fi


########################
# Updating the Library #
########################
function update-lib-linux() {
	wget https://github.com/AwlsomeAlex/StarLinux/archive/StarOS.zip -q --show-progress # Assuming not linked to Library :(
	unzip -q StarOS
	rm -rf StarOS.zip
	cp -r StarLinux-StarOS/linux.lib linux.lib
	rm -rf StarLinux-StarOS
	if [ -f linux.lib ]; then
		. ./linux.lib
		echo -e "${GN} Star Package Manager $SPML_VER has been installed!${NC}"
		if [[ ! $SPML_VER == $SPM_VER ]]; then
			echo "${RD}However, it was the wrong version... Try again in a few minutes. Maybe the repository is updating?${NC}"
			exit 1
		fi
		exit 0
	else
		echo "The Library Installation has failed. Please check your Internet Connection or File Permissions."
		exit 1
	fi
}


##############################
# Main Script Execution Area #
##############################
main
