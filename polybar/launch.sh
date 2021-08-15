#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# launch bar
polybar example 2>&1 > /var/log/polybar/bar.log & disown
