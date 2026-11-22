#!/bin/bash

batteryPercent=$(cat /sys/class/power_supply/BAT0/capacity)
isSupplyActive=$(cat /sys/class/power_supply/ADP0/online)

# Checks if AC is connected
if [ "$isSupplyActive" -eq 0 ]; then
   if [ "$batteryPercent" -lt 50 ]; then
      echo "battery threshold triggered - shutting down"
      shutdown -h now
   else
      echo "AC disconnected, battery above threshold"
  fi
fi