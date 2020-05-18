#! /bin/bash

#===================================================
# Bash script for dotDesktop menu
# Author: Raimundo Nonato
# version: 1.0.4
#===================================================

source fileCreator.sh

# Verify if there a .desktop file for the application
firstRun

function menu() {
    CHOICE=$(zenity --list --window-icon=question --title="dotDesktop Menu" --text="Welcome to dotDesktop\nWhat you want do?" --column="Action" "Create" "exit")

    if [ "$CHOICE" = "Create" ]
    then
        getInfo
    elif [ "$?" = "1" ] 
    then
        exit
    else
        exit
    fi

}

menu