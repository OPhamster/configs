#!/bin/bash
xrandr --output HDMI-A-0 --mode 2560x1440 --left-of eDP --rotate normal --primary
xrandr --output eDP --mode 1920x1200 --pos 2560x240 --rotate normal

# wallpaper
nitrogen --restore

# polybar
~/.config/polybar/launch.sh
