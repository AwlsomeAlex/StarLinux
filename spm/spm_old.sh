#!/bin/bash
# Star Package Manager Master Executable

################################
#                              #
# Star Package Manager Library #
#                              #
################################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

SPM_VER="GIT-20180209-001"
echo "The Star Package Manager Library will now be loaded. If not found the program will exit."

# Check if Native or Hosted and load SPM Library
if [ -f /etc/staros.txt ]; then
	NATIVE=True
	source /lib/spm.lib || exit 1
	assurance
else
	NATIVE=False
	. spm.lib || exit 1
	assurance
fi

if [[ ! $SPML_VER == $SPM_VER ]]; then
	echo "WARNING: The Executable '$SPM_VER' is a different version than the Library '$SPML_VER'. Proceed with caution!"
fi
update_repo || echo "An internet connection could not be established. This is required."

function test() {
	echo "Hello"
} 