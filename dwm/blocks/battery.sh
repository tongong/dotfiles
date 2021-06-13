#!/bin/sh

# Check if battery directories are detected
[ ! -e /sys/class/power_supply/BAT?* ] && echo "No battery found" && exit 1

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*
do
	# Sets up the status and capacity
	status=$(cat "$battery/status")
	case "$status" in
		"Charging") icon="" ;;
        *)          icon="" ;;
	esac
	capacity=$(cat "$battery/capacity")
	# Will make a warn variable if discharging and low
    warn=""
	[ "$status" = "Discharging" ] && [ "$capacity" -le 10 ] && warn=" LOW BATTERY "
	# Prints the info
	printf "%s%s %03d%%\n" "$warn" "$icon" "$capacity";
done
