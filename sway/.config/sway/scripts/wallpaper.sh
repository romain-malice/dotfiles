#!/usr/bin/bash
wal_dir="$HOME/Pictures/backgrounds"
file=$(ls $wal_dir | shuf -n 1)
wal -i "$wall_dir/$file" -n
