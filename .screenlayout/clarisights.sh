#!/bin/sh

if [[ $(xrandr -q | grep ' connected' | wc -l) -eq 2 ]]; then
	xrandr --output eDP-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal
fi
