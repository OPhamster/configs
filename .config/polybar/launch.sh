#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
for monitor in $(polybar -M | cut -d ':' -f 1);
do
    MONITOR=$monitor polybar top 2>&1 | tee -a /tmp/polybar1-$monitor.log & disown;
    MONITOR=$monitor polybar bottom 2>&1 | tee -a /tmp/polybar2-$monitor.log & disown;
done

echo "Bars launched..."
