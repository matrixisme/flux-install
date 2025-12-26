
source /etc/os-release

OPTIONS=(
	1 "1. Minimal"
	2 "2. Desktop Environments"
	3 "3. Window Managers"
	4 "4. Xorg"
)

choices=$(dialog --clear --backtitle "flux-install | install $PRETTY_NAME" --title "$PRETTY_NAME installation program" --menu "Select a suite:" 15 40 4 "${OPTIONS[@]}" 2>&1 >/dev/tty)

# Get the exit status of the dialog command
# 0 usually means OK/Enter was pressed, 1 means Cancel/Escape
exit_status=$?
clear # Clears the dialog box from the terminal
if [ $exit_status -eq 0 ]; then
    case "$choices" in
        1)
            bash minimal.sh
	    bash list.sh
            ;;
        2)
            bash de.sh
	    bash list.sh
            ;;
        3)
            bash wm.sh
	    bash list.sh
            ;;
	4)  
	    bash xorg.sh
	    bash list.sh
	    ;;
    esac
else
    echo "Menu cancelled."
    bash list.sh
fi

