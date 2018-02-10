#!/bin/bash
# Simple Compile Tool for SPM

# Check for SHC
if [ -f spm ]; then
	echo "Removing old Executable"
	rm -rf spm
fi
shc -f spm.sh
rm -rf spm.sh.x.c
mv spm.sh.x spm
