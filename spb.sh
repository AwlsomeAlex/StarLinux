#!/bin/bash

########################
#----------------------#
# Star Package Builder #
#----------------------#
########################
# Created by AwlsomeAlex
# GNU GPLv3 - Open Source


#############
# Variables #
#############
args=("$@") # Arguments which are used in SPB
repo_dir="/tmp/spb/repo" # Directory where Star Repository is stored on the system
repo_link="" # Allows for User-Customization
start_dir=$(pwd)
version="GIT-SPB"

# ----- Colors ----- #
RD='\033[1;31m'
GN='\033[1;32m'
YW='\033[1;33m'
BL='\033[1;34m'
NC='\033[0m'

# !!!!! WARNING !!!!! # When running in Codenvy, execute `sed -i -e 's/\r$//' file` to get rid of garbage!


###################
# Child Functions #
###################
# Set of Secondary Functions
# To assist Primary Functions

# print: Prints text on the terminal (Includes Special Messages in old message() function too!)
function print() (
    function print_usage() (
        echo -e "${RD}Usage: print [message] [argument] [option]"
        echo -e "Message: Displays Text (MUST USE ""!)"
        echo -e "Arguments: -s (Use Special Options) | -c (Define Color)"
        echo -e "Options: ...., DONE, WARN, ERROR"
        echo -e "Colors: Red, Green, Yellow, Blue, Normal${NC}"
    )
    if [ $# = 3 ]; then
        if [ $2 = "-s" ]; then
            if [ $3 = "...." ]; then
                echo -e "${BL}(****) ${NC}$1"
            elif [ $3 = "DONE" ]; then
                echo -e "${GN}(DONE) ${NC}$1"
            elif [ $3 = "WARN" ]; then
                echo -e "${YW}(WARN) ${NC}$1"
            elif [ $3 = "ERROR" ]; then
                echo -e "${RD}(ERROR) ${NC}$1" 
                exit 72
            else
                echo -e "${RD}!ERROR! ${BL}print: ${NC}Invaid Special Marker!"
            fi
        elif [ $2 = "-c" ]; then
            if [ $3 = "Red" ]; then
                echo -e "${RD}$1 ${NC}"
            elif [ $3 = "Green" ]; then
                echo -e "${GN}$1 ${NC}"
            elif [ $3 = "Yellow" ]; then
                echo -e "${YW}$1 ${NC}"
            elif [ $3 = "Blue" ]; then
                echo -e "${BL}$1 ${NC}"
            else
                echo -e "${RD}!ERROR! ${BL}print: ${NC}Invalid Color!"
                print_usage
            fi
        else
            echo -e "${RD}!ERROR! ${BL}print: ${NC}Invalid Option!"
            print_usage
        fi
    elif [ $# = 1 ]; then
        echo -e $1
    else
        echo -e "${RD}!ERROR! ${BL}print: ${NC}Invalid Argument!"
        print_usage
    fi
)

# test: Tests a certain functionality of the program (Debugging)
function test() {
    print "Hello World"
    print "Loading File" -s ....
    print "Blue!" -c Blue
    print hello word jhe
}

test