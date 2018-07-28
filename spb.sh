#!/bin/bash
########################
#----------------------#
# Star Package Builder #
#----------------------#
########################
# Created by AwlsomeAlex [GNU GPLv3]
# Version: Protostar-GIT

#############
# Variables #
#############
REPO_DIR="/tmp/spb/repo" # Only Directory NOT DEFINED in the Main Configuration
REPO_LINK="https://github.com/AwlsomeAlex/StarLinux/archive/protostar.zip" # Allows for Custom Repositories
CONFIG_FILE="$REPO_DIR/starlinux.config" # Can change StarLinux to another Configuration File for custom StarLinux Distributions
START_DIR=$(pwd)

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

# message: Display a custom color-coded message for User Output and Debugging
function message() (
  option=$1
  message=$2
  if [ "$option" = "" ]; then
    echo -e "${RC}Usage: message [option] [message]"
    echo -e "Option: ...., DONE, WARN, ERROR"
    echo -e "Message: Display Text for Certain Messages${NC}"
  elif [ "$option" = "...." ]; then
    echo -e "${BL}(****) ${NC} $message"
  elif [ "$option" = "DONE" ]; then
    echo -e "${GN}(DONE) ${NC} $message"
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
  else
    echo -e "${RC}Usage: message [option] [message]"
    echo -e "Option: ...., DONE, WARN, ERROR"
    echo -e "Message: Display Text for Certain Messages${NC}"
  fi
)

# download: Downloads a file from the SPM Repository
function download() (
  ## Created by AwlsomeAlex [GNU GPLv3]
  ## User-Friendly and Noise-Free Downloader powered by wget
  ## NOTE: Modified for easy download of SPM Repository
  file=$1
  ticker=$2
  if [ "$file" = "REPO" ]; then
    wget $REPO_DIR -q --show-progress
  elif [ "$file" = "" ]; then
    echo -e "${RD} Usage: download [file] [option]"
    echo -e "Options: -s (Silent Downloa Option) [REQUIRES WGET >= 1.18]"
    echo -e "File: REPO | Download Link${NC}"
  else
    if [ "$ticker" = "-s" ]; then
      wget $file -q
    else
      wget $file -q --show-progress
    fi
  fi
)

# read_config: Reads the Master Configuration File included with the Downloaded SPB Repository
function read_config() (
  var_name=$1
  var_value=
  if [ ! "$var_name" = "" ]; then
    var_value="`grep -i ^${var_name}= $CONFIG_FILE | cut -f2- -d'=' | xargs`"
  else
    message ERROR "read_config: Variable Name not defined!"
  fi
  if [ "$var_value" = "" ]; then
    message ERROR "read_config: Variable $var_name returned no value!"
  fi
  echo "$var_value"
)

# test: Dynamic Function to test experimental functionality
# Current Task: Read Configuration File Variable "TEST"
function test() (
  read_config TEST
)

# check: Checks for Repository and Protostar Directories
function check() (
  if [ ! -d $REPO_DIR ]; then
    update
  fi
  if [ "$PACKAGE" = "" ]; then
    message ERROR "$EXECUTE: No Package Defined!"
  fi
  if [ ! -d $REPO_DIR/$PACKAGE ]; then
    message ERROR "$EXECUTE: Package $PACKAGE not found!"
  fi
)

# title: Displays a title
function title() (
  clear
  echo -e "${GN}========================"
  echo -e "| Star Package Builder |"
  echo -e "========================${NC}"
  echo -e "${BL}Created by AwlsomeAlex [GNU GPLv3]${NC}"
  echo ""
  if [ ! -d $REPO_DIR ]; then
    echo -e "${RD} - Repository Not Downloaded!${NC}"
  else
    echo -e "${BL} - Repsoitory Version `read_config REPO_DATE`${NC}"
  fi
  if [ -d $REPO_DIR ]; then
    if [ -d $ `read_config MAIN_DIR` ]; then
      echo -e "${BL} - Work Directory Located at: `read_config MAIN_DIR`${NC}"
    fi
  else
    echo -e "${RD} - Work Directory Not Found! ${NC}"
  fi
  echo ""
)

#####################
# Primary Functions #
#####################
# Functions which SPB is designed
# to execute, like Package Building

# update: Updates the Repository
function update() {
  echo -e "${GN}Star Package Builder - Updating Repository.... ${NC}"
  if [ -d $REPO_DIR ]; then
    rm -rf $REPO_DIR
  fi
  mkdir -p $REPO_DIR
  cd $REPO_DIR/..
  download REPO
  unzip -q protostar
  rm -rf protostar.zip
  cp -r StarLinux-protostar/repo/* repo/
  rm -rf StarLinux-protostar
  message DONE "Updated Repository to ${GN}`read_config REPO_DATE`${NC}"
}

# build: Builds a Package from the Repository
function build() {
  check
  cd $REPO_DIR/$PACKAGE
  echo -e "${GN}Star Package Builder - Building $PACKAGE ${NC}"
  ./build.sh
  cd $START_DIR
}

# main: The main function executed at load
function main() {
  case "$COMMAND" in
    update)
      update
      ;;
    build)
      build
      ;;
    test)
      test
      ;;
    *)
      title
      echo -e "${RD}Usage: $0 [update,build]"
      echo -e "   update:   Updates the SPB Repository"
      echo -e "   build:    Builds a SPB Package${NC}"
  esac
}

#####################
# Primary Execution #
#####################
# Main Function Execution
main
