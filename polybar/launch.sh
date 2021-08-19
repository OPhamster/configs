#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# launch bar
monitors=$(xrandr --query | grep \ connected | cut -d " " -f1)
# the systray should only show up on the primary display
systray_monitor=$(xrandr --query | grep \ primary | cut -d " " -f1)
for monitor in $monitors; do
    if [ ${monitor} == ${systray_monitor} ]; then
        MONITOR=$monitor SYSTRAY_POSITION=right polybar example 2>&1 > /var/log/polybar/${monitor}_bar.log & disown
    else
        MONITOR=$monitor polybar example 2>&1 > /var/log/polybar/${monitor}_bar.log & disown
    fi
done
