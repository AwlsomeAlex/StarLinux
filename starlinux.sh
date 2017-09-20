#!/bin/bash
##########################
#                        #
# StarLinux Build Script #
#                        #
##########################
# Created by AwlsomeAlex [GNU GPLv3]
# Version GIT

# ----- Configration Area -----#
WORK_AREA=/tmp/starlinux
ERROR_CODE="NO_COMMAND"
PACKAGE="NULL"
PROCESS="NULL"
JOB_FACTOR=1
NUM_CORES=$(grep ^processor /proc/cpuinfo | wc -l)
NUM_JOBS=$((NUM_CORES * JOB_FACTOR))

#----- Function Area -----#
logo() {
    clear
    echo ""
    echo "====================="
    echo "| StarLinux Builder |"
    echo "|-------------------|"
    echo "|   By AwlsomeAlex  |"
    echo "|     GNU GPLv3     |"
    echo "====================="
    echo "     Version: GIT    "
    echo ""
}
process() {
    # clear
    logo
    echo "==================="
    echo "| Current Package: "
    echo "| $PACKAGE         "
    echo "|------------------"
    echo "| Current Process: "
    echo "| $PROCESS         "
    echo "==================="
    echo "RESULT:"
}
endit() {
    logo
    echo "The StarLinux Builder Script will now exit."
    echo "If there was an error. It will display a code here:"
    echo "========================"
    echo "| StarLinux Error Code: "
    echo "| $ERROR_CODE           "
    echo "========================"
    echo "Thank you for using StarLinux!"
    echo ""
    exit
}
network_timeout() {
	ERROR_CODE="NETWORK_TIMEOUT"
	endit
}

#----- Script Area -----#

## Begin by checking for Old Work Area.
if [ -d $WORK_AREA ]; then
    logo
    echo "WARNING: The Previous Work Area '$WORK_AREA' still exists."
    echo "Would you like to Overwrite it? (y/n)"
    read OPTION
        if [[ $OPTION = "y" ]]; then
            logo
            PACKAGE="StarLinux Script"
            PROCESS="Deleting Old Directory..."
            process
            rm -rf $WORK_AREA
            echo "Old Work Area has been Deleted."
            sleep 2
        elif [[ $OPTION == "n" ]]; then
            logo
            echo "StarLinux Utility will not Overwrite the Old Work Area. (May Cause Problems...)"
            sleep 2
            ERROR_CODE="USED_WORK_DIRECTORY"
            endit
        else
            ERROR_CODE="INVALID_OPTION"
            endit
        fi
fi
## Now create the new Work Area.
PACKAGE="StarLinux Script"
PROCESS="Creating Work Area..."
process
mkdir -p $WORK_AREA/{Source/Library,Source/Archive,Work/Final,Final}
echo "Work Area has been created."

## Ask user which option they'd like to choose.
logo
echo "Welcome to the StarLinux Build Utility Script. Please select an option below:"
echo ""
echo "1.) UPDATE - Creates InitramFS and Kernel Archives for easy StarLinux Updates."
echo "2.) NEBULA - Creates a LiveCD of the Bare Minimum required for StarLinux to boot."
echo "3.) STATIC - Same as NEBULA except the static-get script is provided and Network Drivers are enabled."
echo "4.) PROTOSTAR - Same as STATIC except instead of static-get, it's the Star Package Manager plus it's Installable."
echo "5.) SUN - A beefed version of PROTOSTAR that gives StarLinux the ability to be Self-Hosted + GNU Userland."
echo "6.) SUPERNOVA - A fully fledged TUI Linux Distribution with Utilities such as Web Browser, Mail Client, etc."
echo "7.) NEUTRON - SUPERNOVA but with a Graphical Interface [Xorg] and GUI Utilities."
echo ""
read OPTION
    if [ $OPTION == 1 ]; then
        ## StarLinux Update Package
        PACKAGE="StarLinux Update Library"
        PROCESS="Downloading Files..."
        process
        wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/new/recipe/build/update.lib -O $WORK_AREA/Source/Library/start.lib -q --show-progress || network_timeout
        . $WORK_AREA/Source/Library/start.lib
        start || ERROR_CODE="START_FAILED" && endit
    elif [ $OPTION == 2 ]; then
        ## StarLinux Nebula (Git)
        PACKAGE="StarLinux Nebula Library"
        PROCESS="Downloading Files..."
        process
        wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/new/recipe/build/nebula.lib -O $WORK_AREA/Source/Library/start.lib -q --show-progress || network_timeout
        . $WORK_AREA/Source/Library/start.lib
        start || ERROR_CODE="START_FAILED" && endit
    elif [ $OPTION == 3 ]; then
      ## StarLinux Static (Git)
      PACKAGE="StarLinux Static Library"
      PROCESS="Downloading Files..."
      process
      wget https://raw.githubusercontent.com/AwlsomeAlex/StarLinux/new/recipe/build/static.lib -O $WORK_AREA/Source/Library/start.lib -q --show-progress || network_timeout
      . $WORK_AREA/Source/Library/start.lib
      start || ERROR_CODE="START_FAILED" && endit
    else
        ERROR_CODE="UNIMPLEMENTED_FEATURE"
        endit
    fi
