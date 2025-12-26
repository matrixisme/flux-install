#!/bin/bash
source /etc/os-release

OPTIONS=(
	1 "1. Keyboard"
	2 "2. Hostname"
	3 "3. Locale"
	4 "4. Time Zone"
	5 "5. Root Password"
	6 "6. User (only one)"
	7 "7. Bootloader"
	8 "8. Suites (Profile)"
	9 "9. Partitioning"
	10 "10. Installing"
)

choices=$(dialog --clear --backtitle "flux-install | install $PRETTY_NAME" --title "$PRETTY_NAME installation program" --menu "Select an option:" 15 40 4 "${OPTIONS[@]}" 2>&1 >/dev/tty)

# Get the exit status of the dialog command
# 0 usually means OK/Enter was pressed, 1 means Cancel/Escape
exit_status=$?
clear # Clears the dialog box from the terminal
if [ $exit_status -eq 0 ]; then
    case "$choices" in
        1)
            bash 01-*.sh
            ;;
        2)
            bash 02-*.sh
            ;;
        3)
            bash 03-*.sh
            ;;
	4)  
	    bash 04-*.sh
	    ;;
	5)
	    bash 05-*.sh
	    ;;
	6)
	    bash 06-*.sh
	    ;;
	7)
	    bash 07-*.sh
	    ;;
	8)
	    bash 08-*.sh
	    ;;
    esac
else
    echo "Menu cancelled."
fi

