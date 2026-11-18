#!/bin/sh
xrandr --output eDP --off
xrandr --output HDMI-A-0 --mode 3840x2160 --rotate normal --primary

# wallpaper
nitrogen --restore

# polybar
~/.config/polybar/launch.sh
