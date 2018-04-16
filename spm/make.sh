#!/bin/bash
# SPM Shell Script Compiler
# Created by AwlsomeAlex (GNU GPLv3)

# Check for SHC on machine
if [[ $(type shc) = "" ]]; then
	echo "The program SHC is not installed."
	echo "Please install it with `sudo apt install shc` and try again."
	exit 1
fi
# Check for precompiled SPM
if [ -f spm ]; then
	echo "Removing old Executable"
	rm -rf spm
fi
shc -f spm.sh
rm -rf spm.sh.x.c
mv spm.sh.x spm
