#!/bin/bash

source /etc/os-release

dialog --backtitle "flux-install | install $PRETTY_NAME" --title "$PRETTY_NAME installation program" --msgbox "Welcome to flux-install! The program will now setup $PRETTY_NAME on your PC" 0 0

if [ $? -eq 0 ]; then
	clear
	ls

	bash list.sh
fi
