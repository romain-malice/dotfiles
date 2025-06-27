#!/bin/bash

options="Power Off\nReboot\nSuspend\nLog Out\nCancel"

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
    'Log Out')
        logout
    ;;
    'Cancel')
        exit 0
    ;;
esac
