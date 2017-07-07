#!/bin/sh
# Created by AwlsomeAlex (GNU GPLv3)
# Static-Get by Javier Lopez
# Version GIT

########################
# Star Package Manager #
########################
# Star Package Manager is a 
# simple to use package manager
# that integrates the static-get
# and installs the programs it
# downloads and extracts onto
# the StarLinux Root Directory.
# The way it will work is this
# scirpt will retrieve a formula
# from the StarLinux Repository
# and will execute the commands
# needed to give your system that
# program. 

# Functions:
logo () {
	clear
	echo ""
	echo "========================"
	echo "| Star Package Manager |"
	echo "|----------------------|"
	echo "|Created by AwlsomeAlex|"
	echo "========================"
	echo ""
}


display_help () {
	logo
	cat /etc/spm/help.txt
	exit 0
}

list_packages () {
	logo
	cat /etc/spm/packages.txt
	exit 0
}

update_spm () {
	logo
	echo ""
	echo "Updating Star Package Manager Package Repository..."
	echo ""
	echo "NOTE: Internet Access is required!"
	echo "WARNING: StarLinux BusyBox 1.26.2 and below is NOT SUPPORTED!"
	sleep 3
	cd /tmp
	echo "Removing old Star Package Manager Files..."
	rm -rf /etc/spm/packages.txt
	echo "Downloading latest Star Package Manager Files..."
	# THIS IS A TEMPORARY DEVEL TREE DOWNLOAD LINK
	wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/devel/spm/packages.txt
	echo "Installing Latest Star Package Manager Package Repository..."
	cp packages.txt /etc/spm/packages.txt
	rm -rf packages.txt
	echo ""
	echo "Star Package Manager Package Repository has been updated."
	cd /
	exit 0
}

install_package () {
	PACKAGE="$1"
	logo 
	echo ""
	echo "Star Package Manager will now Download and Install $PACKAGE"
	echo ""
	echo "NOTE: Internet Access is required!"
	echo "WARNING: StarLinux BusyBox 1.26.2 and below is NOT SUPPORTED!"
	sleep 3
	logo
	echo "Downloading $PACKAGE Installation Recipe..."
	mkdir -p /tmp/spm
	cd /tmp/spm
	# THIS IS A TEMPORARY DEVEL TREE DOWNLOAD LINK
	wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/devel/spm/recipes/$PACKAGE.lib
	if [ ! -f "$PACKAGE.lib" ] ; then
		echo "Star Package Manager failed to retrieve the Installation Recipe. Please try again later."
		rm -rf /tmp/spm
		exit 0
	fi
	. ./$PACKAGE.lib
	logo
	echo "Star Package Manager will now start the Installation Recipe to install $PACKAGE."
	sleep 3
	install_$PACKAGE

install_spm () {
	logo
	echo ""
	echo "Star Package Manager will now be installed onto the system."
	echo ""
	echo "NOTE: Internet Access is required!"
	echo "WARNING: StarLinux BusyBox 1.26.2 and below is NOT SUPPORTED!"
	sleep 3
	logo
	echo "Creating Star Package Manager Directories..."
	sleep 3
	mkdir -p /etc/spm
	logo
	echo "Required Star Package Manager Files will now be downloaded..."
	sleep 3
	mkdir /tmp/spm_download
	cd /tmp/spm_download
	echo "Downloading Latest Star Package Manager Executable (GIT)..."
	# THIS IS A TEMPORARY DEVEL TREE DOWNLOAD LINK
	wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/devel/spm/spm.sh
	echo "Downloading Latest Star Package Manager Files (GIT)..."
	# THIS IS A TEMPORARY DEVEL TREE DOWNLOAD LINK
	wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/devel/spm/packages.txt
	wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/devel/spm/help.txt
	echo "Downloading Latest Static-Get Script..."
	wget http://s.minos.io/s
	echo "Required Star Package Manager Files Downloaded."
	sleep 3
	logo
	echo "Installing Star Package Manager..."
	sleep 3
	cp s /usr/bin/static-get
	chmod +x /usr/bin/static-get
	cp spm.sh /usr/bin/spm
	chmod +x /usr/bin/spm
	cp help.txt /etc/spm/help.txt
	cp packages.txt /etc/spm/packages.txt
	echo "Star Package Manager has been successfully installed! Please reboot your StarLinux Machine to continue!"
	cd /
	rm -rf /tmp/spm_download
	exit 1
}

# Check for options:

if [ -f "./spm.sh" ]; then
	install_spm
fi

if [ "$1" = "" -o "$1" = "-h" -o "$1" = "--help" ] ; then
	display_help
elif [[ "$1" = "$(grep -r "$1" "/etc/spm/packages.txt")" ]] ; then
	install_package
elif [ "$1" = "list" -o "$1" = "-l" ] ; then
	list_packages
elif [ "$1" = "update" -o "$1" = "-u" ] ; then
	update_spm
else
	echo "SPM: Invalid Command or Unknown Package. Please type 'spm list' for a list of packages."
fi


