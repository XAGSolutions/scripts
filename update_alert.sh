#!/bin/bash

# Set the notification message and title
message="Please reboot your computer."
title="Reboot Required"

# Set the path to the image file for the icon
icon_path="/Users/Shared/XAG_XLogomark_Digital_XAGGreen.png"

# Display the notification
osascript -e "display notification \"$message\" with title \"$title\""

# Prompt the user to reboot the machine
button_pressed=$(osascript -e "tell app \"System Events\" to display dialog \"XAG Solutions has delivered some critical software updates for this machine.  Please save anything that you are working on, close all applications, and then click Restart Now below.\" buttons {\"Restart Now\", \"Later\"} default button \"Restart Now\" with icon POSIX file \"$icon_path\" position {100,100}")
# Check which button was pressed
if [[ "$button_pressed" == "button returned:Restart Now" ]]; then
    # Restart the machine
    sudo shutdown -r now
fi
