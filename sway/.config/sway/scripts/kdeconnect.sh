#!/bin/bash

# Choosing a device
device_name=$(kdeconnect-cli -l --name-only | fuzzel --dmenu -p "Connect to : " || exit 0)

# Choosing an action to perform
actions="Share File\nCopy Clipboard"
choice=$(echo -e $actions | fuzzel --dmenu -p "Action : " || exit 0)

case "$choice" in
    'Share File') kdeconnect-cli -n $device_name -share $(fzf)
    ;;
    'Copy Clipboard') kdeconnect-cli -n $device_name --send-clipboard
    ;;
esac
