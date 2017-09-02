#!/bin/bash
##########################
#                        #
# StarLinux Build Script #
#                        #
##########################
# Created by AwlsomeAlex [GNU GPLv3]

# ----- Configration Area -----#
WORK_AREA=/tmp/starlinux
ERROR_CODE=NULL
PACKAGE="NULL"
PROCESS="NULL"

#----- Function Area -----#
logo() {
    clear
    echo ""
    echo "====================="
    echo "| StarLinux Utility |"
    echo "|-------------------|"
    echo "|   By AwlsomeAlex  |"
    echo "|     GNU GPLv3     |"
    echo "====================="
    echo ""
}
process() {
    clear
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
    echo "The StarLinux Utility Script will now exit."
    echo "If there was an error. It will display a code here:"
    echo "========================"
    echo "| StarLinux Error Code: "
    echo "| $ERROR_CODE           "
    echo "========================"
    echo "Thank you for using StarLinux!"
    echo ""
    exit
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
PACKAGE="StarLinux Script"
PROCESS="Creating Work Area..."
process
mkdir -p $WORK_AREA
echo "Work Area has been created."
