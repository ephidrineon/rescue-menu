#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Arch-Rescue quick start menu"
TITLE="Quick Start"
MENU="Hardware menu:"

OPTIONS=(1 "Information gathering"
         2 "Stress testing"
         3 "Advanced tests"
 	 4 "Back")

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
            sh hw-info.sh;
            ;;
        2)
            sh hw-stress.sh;
            ;;
        3)
            sh hw-advanced.sh;
            ;;
	4)
	    sh qs.sh;
	    ;;
esac
