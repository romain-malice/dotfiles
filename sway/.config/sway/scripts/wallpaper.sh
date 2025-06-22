#!/usr/bin/bash
wal_dir="$HOME/Pictures/Screenshots"
file=$(ls $wal_dir | shuf -n 1)
wal -i "$wall_dir/$file"
