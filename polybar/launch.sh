#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# launch bar
monitors=$(xrandr --query | grep \ connected | cut -d " " -f1)
for monitor in $monitors; do
    MONITOR=$monitor polybar example 2>&1 > /var/log/polybar/${monitor}_bar.log & disown
done
