#!/bin/sh
xrandr --output eDP --off --output HDMI-A-0 --scale 0.80 --mode 3840x2160 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off

# wallpaper
nitrogen --restore

# polybar
~/.config/polybar/launch.sh
