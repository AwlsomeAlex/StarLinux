#!/bin/bash
# Star Package Manager Master Executable

################################
#                              #
# Star Package Manager Library #
#                              #
################################
# Created by AwlsomeAlex [GPLv3]
# Compatible with StarOS & Star Library

SPM_VER="GIT"

# Check if Native or Hosted and load SPM Library
if [ -f /etc/staros.txt ]; then
	echo "This is running on StarOS."
	NATIVE=True
	source /lib/spm.lib || echo "WARNING: The Star Package Manager Libray could not be found. This is a problem." && exit 1
else
	echo "Running on another Linux Distribution."
	NATIVE=False
	source spm.lib || echo "WARNING: The Star Package Manager Library could not be found. Please place it in the same directory as the executable." && exit 1
fi
if ! [[ $SPML_VER == $SPM_VER ]]; then
	echo "WARNING: The Executable $SPM_VER is a different version than the Library $SPML_VER. Proceed with caution!"
fi
update_repo || echo "An internet connection could not be established. This is required."

