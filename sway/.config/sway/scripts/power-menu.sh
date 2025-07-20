#!/bin/bash

options="Power Off\nReboot\nSuspend\nCancel"

choice=$(echo -e $options | fuzzel --dmenu -p "Power Menu : " || exit 0)

case "$choice" in
    'Suspend')
        systemctl suspend
    ;;
    'Power Off')
        shutdown now
    ;;
    'Reboot')
        reboot
    ;;
    'Cancel')
        exit 0
    ;;
esac
