#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch Polybar on each connected monitor
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar1 >> /tmp/polybar1.log 2>&1 &
  done
else
  polybar --reload bar1 >> /tmp/polybar1.log 2>&1 &
fi

echo "Bars launched..."
