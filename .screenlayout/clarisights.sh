#!/bin/bash

xrandr --output HDMI-A-0 --mode 3840x2160 --left-of eDP --rotate normal --primary
xrandr --output eDP --mode 1920x1200 --rotate normal --pos 3840x960

# wallpaper
nitrogen --restore

# polybar
~/.config/polybar/launch.sh
