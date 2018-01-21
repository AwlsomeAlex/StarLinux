#!/bin/bash
# Star Package Manager Compile Script

##################################
# Star Package Manager - Compile #
##################################
# Created by AwlsomeAlex [GNU GPLv3]

TITLE="SPM Compiler"
VERSION="GIT"
SPM_VER="GIT"

echo "Checking for Star Library..."
if [ -d "/usr/lib/slib" ]; then
	source /usr/lib/slib/master.lib
	echo "Loaded Star Library Version $SLIB_VER"
else
	echo "WARNING: The Star Library is not installed or OUT OF DATE. Please install it and try again."
	exit 2
fi

install() {
	FUNCTION="Installation"
	install_required build-essential 
	install_required shc
	title
	echo "The Script will now compile/install the Star Package Manager."
	wait 3
	echo " --- Downloading StarOS --- "
	mkdir /tmp/spm
	cd /tmp/spm
	download StarOS
	unzip StarOS.zip || echo "The Package 'unzip' is currently not installed and needs to be!" && sudo rm -rf /usr/lib/slib && exit 999
	cd StarOS/spm
	echo " --- Compiling SPM --- "
	shc -f spm.sh 
	mv spm.sh.x spm
	chmod +x spm
	echo " --- Installing SPM --- "
	sudo cp spm /usr/bin/
	sudo cp spm.lib /usr/lib/slib/
	sudo touch /usr/lib/slib/spm.txt
	sudo echo $VERSION > /usr/lib/slib/spm.txt
	echo "=== Installation Complete ==="
	exit 1

}
