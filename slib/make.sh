#!/bin/bash
# Star Library Compile Script

##########################
# Star Library - Compile #
##########################
# Created by AwlsomeAlex [GNU GPLv3]

VERSION="GIT"

echo ""
echo "Welcome to the Star Library Compiler!"
echo "Created by AwlsomeAlex [GNU GPLv3]"
echo ""

if [ -d "/usr/lib/slib" ]; then
	echo "ERROR: The Star Library is already installed. Please execute slib-update to update or repair."
	exit 2
fi
echo "Creating Directories..."
echo "!!! THIS REQUIRES SUPERUSER PERMISSION !!!"
echo ""
sudo mkdir -p /usr/lib/slib
if [ -d "/usr/lib/slib" ]; then
	echo "The files have been created successfully!"
	wait 3
else
	echo "There was an error creating the files. Are you not the Super User or Sudo?"
	exit 4
fi
echo ""
echo "Downloading Files..."
sudo mkdir -p /usr/lib/slib/tmp/
cd /usr/lib/slib/tmp
wget https://github.com/AwlsomeAlex/StarLinux/archive/StarOS.zip -q --show-progress
unzip StarOS.zip || echo "The Package 'unzip' is currently not installed and needs to be!" && sudo rm -rf /usr/lib/slib && exit 999
cd StarOS
echo ""
echo "Processing Star Library Files..."
sudo cp -r lib /usr/lib/slib/
sudo cp -r slib-update /usr/bin/
sudo touch /usr/lib/slib/slib.txt
sudo echo "$VERSION" > /usr/lib/slib/slib.txt
echo ""
echo "Star Library has been installed!"
exit 0
