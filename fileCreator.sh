#! /bin/bash

#===================================================
# Bash script for .desktop Creation
# Author: Raimundo Nonato
# version: 1.0.4
#===================================================

#Own desktop file configuration

APPLICATIONSPATH="$HOME/.local/share/applications/"
MYDESKTOPFILE="dotDesktop.desktop"

# Own desktop file verification

function firstRun() {
    if [ -f "$APPLICATIONSPATH$MYDESKTOPFILE" ] 
    then 
        echo "Everything is alright!"   
    else 
        zenity --question --title="dotDesktop" --text="There is no .desktop file to this application, want create one?"

        echo $?

        if [ "$?" = "0" ]
        then
            NAME="dotDesktop"
            VERSION="1.3"
            COMMENT="A .desktop file creator"
            TYPE="Application"
            FILEPATH=$(realpath -e dotDesktop.sh)
            ICON=$(realpath -e ./Assets/icon.png)
            CATEGORIES="System;Utility"

            APPLICATIONDESKTOP="$APPLICATIONSPATH$MYDESKTOPFILE"

            createFile
        fi
    fi
}

function getInfo() {

    NAME=$(zenity --entry --title="Application name" --text="Name(Obligatory):")

    VERSION=$(zenity --entry --title="Application version" --text="Application version")

    COMMENT=$(zenity --entry --title="Application comment" --text="Comment")

    TYPE=$(zenity --list --window-icon=question --title="Application type" --text="(Obligatory)" --column="Type" "Application" "Link" "Directory")

    FILEPATH=$(zenity --file-selection --title="Application path")

    ICON=$(zenity --file-selection --file-filter="*.png *.svg" --title="Application icon")

    CATEGORIES=$(zenity --list \
                        --multiple \
                        --text="Select the categories(More than one can be selected!)" \
                        --title="Application categoria" \
                        --column="Categories" "AudioVideo" "Development" "Education" "Game" "Graphics" "Network" "Office" "Science" "Settings" "System" "Utility" \
                        --separator=";")

    APPLICATIONDESKTOP="$APPLICATIONSPATH$NAME.desktop"

    createFile
}

function createFile() {

        if [ -f "$APPLICATIONDESKTOP" ]
        then
            zenity --question --title="Overwrite" --text="File already exist, overwrite?"

            if [ "$?" = "0" ]
            then
                rm -rf $APPLICATIONDESKTOP       
            else
                zenity --info --text="File Creation canceled!"

                menu
            fi
        else
                touch $APPLICATIONDESKTOP

                echo "[Desktop Entry]" >> $APPLICATIONDESKTOP
                echo "" >> $APPLICATIONDESKTOP
                echo "Name=$NAME" >> $APPLICATIONDESKTOP
                echo "Version=$VERSION" >> $APPLICATIONDESKTOP
                echo "Comment='$COMMENT'" >> $APPLICATIONDESKTOP
                echo "Type=$TYPE" >> $APPLICATIONDESKTOP
                echo "Exec='$FILEPATH'" >> $APPLICATIONDESKTOP
                echo "Icon=$ICON" >> $APPLICATIONDESKTOP
                echo "Categories=$CATEGORIES;" >> $APPLICATIONDESKTOP

                zenity --info --text=".Desktop file created!"

                menu
        fi
}