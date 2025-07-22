#!/bin/bash

# Choosing a device
device_name=$(kdeconnect-cli -l --name-only | rofi -dmenu -p "Connect to : " || exit 0)

# Choosing an action to perform
actions="Share File\nCopy Clipboard"
choice=$(echo -e $actions | rofi -dmenu -p "Action : " || exit 0)

case "$choice" in
    'Share File') kdeconnect-cli -n $device_name -share $(fzf)
    ;;
    'Copy Clipboard') kdeconnect-cli -n $device_name --send-clipboard
    ;;
esac
