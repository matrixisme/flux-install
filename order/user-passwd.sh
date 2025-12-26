# this will be parsed as a bash script

source /etc/os-release
# Define variables
DIALOG_HEIGHT=10
DIALOG_WIDTH=40
PROMPT_MESSAGE="Please enter your password for user:"
INITIAL_INPUT="$NAME" # Optional: default value

# Run the dialog command and capture the output
# The command's output (user input) is sent to stderr by default.
# We redirect stderr (2) to stdout (1), which is then captured by the variable assignment `$(...)`.
# The standard output (1) of 'dialog' is redirected to a custom file descriptor (3) 
# which is then closed to prevent unexpected output in the terminal.
exec 3>&1 # Redirect file descriptor 3 to standard output
USER_INPUT=$(dialog --title "Setting up password..." \
                    --clear \
                    --inputbox "$PROMPT_MESSAGE" \
                    $DIALOG_HEIGHT $DIALOG_WIDTH \
                    "$INITIAL_INPUT" \
                    2>&1 1>&3)
exec 3>&- # Close file descriptor 3

# Get the exit status to check if OK or Cancel was pressed
response=$?

# Act on the user's choice
case $response in
  0)
    echo "SYS_PASSWD='$USER_INPUT'" > passwd.txt_config
    bash list.sh
    ;;
  1)
    echo "Cancel was pressed. Input was: $USER_INPUT"
    sleep 3
    bash list.sh
    ;;
  255)
    echo "[ESC] key was pressed. Input was: $USER_INPUT"
    sleep 3
    bash list.sh
    ;;
esac
