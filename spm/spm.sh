#!/bin/bash
# Star Package Manager Master Executable

###############################
#                             #
# Star Package Manager - Exec #
#                             #
###############################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

SPM_VER="GIT-20180209-001"
OPTION="$1"
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
        echo "The Library could not be found. Please place the Library in the same directory as SPM Executable!"
        exit 0
    fi
fi


##############################
# Main Script Execution Area #
##############################
case "$OPTION" in
    test)
        test
        ;;
    *)
        echo -e "${RD}Usage $0 {test}"
        echo -e "Test Text.${NC}"
esac
