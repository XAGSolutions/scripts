#!/bin/bash

# Set the notification message and title
message="Please reboot your computer."
title="Reboot Required"

# Set the path to the image file for the icon
icon_path="/Users/Shared/XAG_XLogomark_Digital_XAGGreen.png"

# Display the notification
osascript -e "display notification \"$message\" with title \"$title\""

# Prompt the user to reboot the machine
button_pressed=$(osascript -e "tell app \"System Events\" to display dialog \"Your computer needs to restart.\" buttons {\"Restart Now\", \"Later\"} default button \"Restart Now\" with icon POSIX file \"$icon_path\"")

# Check which button was pressed
if [[ "$button_pressed" == "button returned:Restart Now" ]]; then
    # Restart the machine
    sudo shutdown -r now
fi
