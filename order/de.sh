
source /etc/os-release

OPTIONS=(
	1 "1. GNOME"
	2 "2. Xfce4"
	3 "3. KDE Plasma"
	4 "4. LXQt"
	5 "5. LXDE"
	6 "6. MATE"
)

choices=$(dialog --clear --backtitle "flux-install | install $PRETTY_NAME" --title "$PRETTY_NAME installation program" --menu "Select a suite:" 15 40 4 "${OPTIONS[@]}" 2>&1 >/dev/tty)

# Get the exit status of the dialog command
# 0 usually means OK/Enter was pressed, 1 means Cancel/Escape
exit_status=$?
clear # Clears the dialog box from the terminal
if [ $exit_status -eq 0 ]; then
    case "$choices" in
        1)
            bash gnome.sh
	    bash list.sh
            ;;
        2)
            bash xfce.sh
	    bash list.sh
            ;;
        3)
            bash plasma.sh
	    bash list.sh
            ;;
	4)  
	    bash lxqt.sh
	    bash list.sh
	    ;;
	5)  
	    bash lxde.sh
	    bash list.sh
	    ;;
	6)  
	    bash mate.sh
	    bash list.sh
	    ;;
    esac
else
    echo "Menu cancelled."
    bash list.sh
fi

