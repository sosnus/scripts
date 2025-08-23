#!/bin/bash

# Script: battery_logger.sh
# Logs battery info every 15 minutes in CSV format

BATTERY=$(upower -e | grep BAT | head -n 1)

if [ -z "$BATTERY" ]; then
    echo "❌ No battery detected by upower!"
    exit 1
fi

LOGFILE="$HOME/battery_log.csv"
echo "time,percent,energy,time_remaining" >> "$LOGFILE"

while true; do
    NOW=$(date +"%Y-%m-%d %H:%M:%S")
    PERCENT=$(upower -i "$BATTERY" | awk '/percentage/ {print $2}' | tr -d '%')
    ENERGY=$(upower -i "$BATTERY" | awk '/energy:/ {print $2" "$3}')
    TIME=$(upower -i "$BATTERY" | awk '/time to/ {$1=$2=""; sub(/^ +/,""); print}')

    echo "$NOW,$PERCENT,$ENERGY,$TIME" | tee -a "$LOGFILE"

    sleep 900
done
