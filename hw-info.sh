#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Arch-Rescue quick start menu"
TITLE="Quick Start"
MENU="Hardware information gathering:"

OPTIONS=(1 "Short info (neofetch)"
	 2 "Short report (lshw)"
	 3 "Full report (lshw)"
	 4 "HDD SMART (smartctl)"
 	 5 "Temperature (lm-sensors)"
 	 6 "Back")

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
            neofetch && read -p "Back to menu [Enter]" && sh hw-info.sh;
            ;;
        2)
            lshw -short && read -p "Back to menu [Enter]" && sh hw-info.sh;
            ;;
        3)
            lshw | less && read -p "Back to menu [Enter]" && sh hw-info.sh;
            ;;
	4)
	    ls -l /dev/sd? > /tmp/drnfo;
	    cat /tmp/drnfo | rev | cut -d" " -f1 | rev > /tmp/drnfoi;
	    wc -l /tmp/drnfoi | cut -d" " -f1 > /tmp/drcnt
	    read DRIVECOUNT < /tmp/drcnt;
	    touch /tmp/driveinfo;
	    for ((i=1; i<$DRIVECOUNT; i++)); do
		    smartctl --all $(sed "${i}q;d" /tmp/drnfoi) >> /tmp/driveinfo
	    done
	    less /tmp/driveinfo && read -p "Back to menu [Enter]" && echo "" > /tmp/drcnt && echo "" > /tmp/drnfo && echo "" > /tmp/driveinfo && sh hw-info.sh;
	    ;;
	5) 
	    sensors | less && read -p "Back to menu [Enter]" && sh hw-info.sh;
	    ;;
	6)
	    sh qs.sh;
	    ;;
esac
