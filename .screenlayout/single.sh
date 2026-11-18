#!/bin/sh
xrandr --output eDP --primary --mode 1920x1200 --rotate normal
xrandr --output HDMI-A-0 --off

# wallpaper
nitrogen --restore

# polybar
~/.config/polybar/launch.sh
