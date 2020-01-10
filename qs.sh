#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Arch-Rescue quick start menu"
TITLE="Quick Start"
MENU="Choose the desired task:"

OPTIONS=(1 "Hardware diagnostics"
         2 "OS troubleshooting and rescue"
         3 "Invasive operations")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Starting hardware diagnostics"
	    sh hw.sh;
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
esac
