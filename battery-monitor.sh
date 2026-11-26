#!/bin/bash

battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
is_supply_active=$(cat /sys/class/power_supply/ADP0/online)

# Checks if AC is connected
if [ "$is_supply_active" -eq 0 ]; then
   if [ "$battery_percent" -lt 50 ]; then
      echo "battery threshold triggered - shutting down"
      shutdown -h now
   else
      echo "AC disconnected, battery above threshold"
  fi
fi