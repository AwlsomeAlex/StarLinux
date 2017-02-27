#!/bin/bash

###################################
#---------------------------------#
# StarBuilder Installation Script #
#---------------------------------#
###################################
# Made by AwlsomeAlex [GNU GPLv3] #
###################################


#############
# Functions #
#############
star_logo() {
	clear
	echo ""
	echo "=========================="
	echo " StarBuilder Installation "
	echo "=========================="
	echo ""
}


install_location() {
	star_logo
	echo "Welcome to StarBuilder Installaton."
	echo "Please Define an Installation Location below."
	echo ""
	echo "(1) -- '/' [Root Directory /bin and /lib] (NOT RECOMMENDED!)"
	echo "(2) -- '/usr/' [User Directory /usr/bin and /usr/lib (RECOMMENDED!)"
	echo ""
	read -p 'Installation Destination: ' INSTALL_CHOICE
}

file_location() {
	star_logo
	echo "Do you wish to Download the Latest Scripts from Git or use Local Archive?"
	echo ""
	echo "(1) -- 'Online' [Downloads and Installs Latest Script from Git.] (RECOMMENDED!)"
	echo "(2) -- 'Local' [Uses Scripts packaged in Archive.] (NOT RECOMMENDED!)"
	echo ""
	read -p 'Script Location: ' FILE_CHOICE
}


variable_sorting() {
	if [ "$INSTALL_CHOICE" == "1" ]; then
		INSTALL_LOCATION="/"
	elif [ "$INSTALL_CHOICE" == "2" ]; then
		INSTALL_LOCATION="/usr/"
	else
		echo "Invalid Installation Location. Exiting..."
		exit 0
	fi
	
	if [ "$FILE_CHOICE" == "1" ]; then
		FILE_LOCATION="online"
	elif [ "$FILE_CHOICE" == "2" ]; then
		FILE_LOCATION="local"
	else
		echo "Invalid File Location. Exiting..."
		exit 0
	fi
}


confirm() {
	star_logo
	echo "Do these options look correct?"
	echo ""
	echo "Installation Location: $INSTALL_LOCATION"
	echo "Script Source Location: $FILE_LOCATION"
	echo ""
	echo "(1) -- Yes, Start Installation!"
	echo "(2) -- No, Configure Options."
	echo "(3) -- Cancel Installation."
	read -p 'Choice: ' CHOICE
}


install () {
	if [ "$CHOICE" == "1" ]; then
		source_check
		install_starbuilder

	elif [ "$CHOICE" == "2" ]; then
		install_location
		file_location
		variable_sorting
		confirm
		install
	else
		exit 1
	fi	

}


source_check () {
	star_logo
	if [ "$FILE_LOCATION" == "local" ]; then
		if [ -d src ]; then
			echo "Source Directory Located."
			echo $FILE_LOCATION
		else
			echo "Source Directory Not Found. Defaulting to Online Download..."
			FILE_LOCATION="online"
			echo $FILE_LOCATION
		fi
	elif [ "$FILE_LOCATION" == "online" ]; then
		star_logo
		echo "Download Latest StarBuilder Source..."
		mkdir /tmp/starbuilder_temp
		cd /tmp/starbuilder_temp
		wget -c --progress=bar:force https://github.com/AwlsomeAlex/StarLinux/archive/master.zip
		unzip master.zip
	fi
}


install_starbuilder () {
	star_logo
	echo "StarBuilder will now be Installed."
	echo "WARNING! StarBuilder Installation WILL Require SUDO/ROOT Access!"
	
	if [ "$FILE_LOCATION" == "local" ]; then
		cd src
		sudo cp starbuilder $INSTALL_LOCATION/bin
		sudo mkdir $INSTALL_LOCATION/lib/starbuilder
		sudo cp starbuilder.lib $INSTALL_LOCATION/lib/starbuilder
		echo ""
		echo "If you saw no errors, StarBuilder has been successfully Installed!"
		echo ""
		exit 1
	elif [ "$FILE_LOCATION" == "online" ]; then
		cd /tmp/starbuilder_temp/StarLinux-master/src
		sudo cp starbuilder $INSTALL_LOCATION/bin
		sudo mkdir $INSTALL_LOCATION/lib/starbuilder
		sudo cp starbuilder.lib $INSTALL_LOCATION/lib/starbuilder
		echo ""
		echo "If you saw no errors, StarBuilder has been sucessfully Installed!"
		echo ""
		rm -rf /tmp/starbuilder_temp
		exit 1
	fi
}


#############
# Execution #
#############
install_location
file_location
variable_sorting
confirm
install
