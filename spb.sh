#!/bin/bash
########################
#----------------------#
# Star Package Builder #
#----------------------#
########################
# Created by AwlsomeAlex [GNU GPLv3]
# Version: Protostar

#############
# Variables #
#############
REPO_DIR="/tmp/spm/repo" # Only Directory NOT configured in Main Configuration
REPO_LINK="https://github.com/AwlsomeAlex/StarLinux/archive/protostar.zip" # Allows for Custom Repositories
CONFIG_FILE="$REPO_DIR/StarLinux.config" # Can change StarLinux to another file for Custom Configuration Files

EXECUTE="$0"
COMMAND="$1"
PACKAGE="$2"

RD='\033[1;31m'
GN='\033[1;32m'
YW='\033[1;33m'
BL='\033[1;34m'
NC='\033[0m'

##### WARNING: When running in Codenavy Execute `sed -i -e 's/\r$//' file` to get rid of garbage! #####

###################
# Child Functions #
###################
# Set of Secondary Functions
# To assist Primary Functions

# message: Displays a custom color-coded message for User Output
function message() (
	option=$1
	message=$2
	if [ "$option" = "" ]; then
		echo -e "${RC}Usage: message [option] [message]"
		echo -e "Option: WARN, ERROR, ...., DONE"
		echo -e "Message: Displays Text for Certain Messages${NC}"
	elif [ "$option" = "WARN" ]; then
		echo ""
		echo "==============="
		echo -e "| ${RD} !!! WARNING !!! ${NC} |"
		echo "==============="
		echo $message
	elif [ "option" = "ERROR" ]; then
		echo ""
		echo "==============="
		echo -e "| ${RD} !!! ERROR !!! ${NC} |"
		echo "==============="
		echo $message
		echo ""
		exit 72
	elif [ "$option" = "...." ]; then
		echo -e "${BL}(****) ${NC} $message"
	elif [ "$option" = "DONE" ]; then
		echo -e "${BL}(DONE) ${NC} $message"
	else
		echo -e "${RC}Usage: message [option] [message]"
		echo -e "Option: WARN, ERROR, ...., DONE"
		echo -e "Message: Displays Text for Certain Messages${NC}"
	fi
)


# download: Downloads a file from the SPM Repository
function download() (
	## Created by AwlsomeAlex [GNU GPLv3]
	## User-Friendly and Noise-Free Downloader powered by wget
	## NOTE: Modified for easy download of Repository
	FILE=$1
	TICKER=$2
	if [ "$FILE" = "Repo" ]; then
		wget $REPO_LINK -q --show-progress
	elif [ "$FILE" = "" ]; then
		echo -e "${RD} Usage: download [file] [option]"
		echo -e "Options: -s (Silent Downloader Option)"
		echo -e "File: Repo | Download Link${NC}"
	else
		if [ "$TICKER" = "-s" ]; then
			wget $FILE -q
		else
			wget $FILE -q --show-progress
		fi
	fi
)

# read_config: Reads the Master Configuration File included with the Downloaded Repository
function read_config() (
	VAR_NAME=$1
	VAR_VALUE=$2
	if [ ! "VAR_NAME" = "" ]; then
		VAR_VALUE="`grep -i ^${variable_name}= $CONFIG_FILE | cut -f2- -d'=' | xargs`"
	else
		message ERROR "read_config: Variable Name Not Defined!"
	fi
	if [ "VAR_VALUE" = "" ]; then
		message ERROR "read_config: Variable $VAR_NAME returned no value!"
	fi
	echo "$VAR_VALUE"
)

# test: Dynamic Function to test experimental functionality
function test() (
	message done "Hello World!"
)

test
