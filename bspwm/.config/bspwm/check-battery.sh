#!/bin/bash

warning=20
critical=10
interval=10

get_current() {
	acpi --battery | cut -d, -f2 | xargs | sed 's/\%//g'
}

while true; do
	echo checking warn
	current=$(get_current)
	if [ $current -le $warning ]; then
		notify-send \
			-u critical \
			-i /usr/share/icons/Mint-X/status/48/battery_low.png \
			"Battery Low" \
			"Your battery is at ${current}%"
		break
	fi
	sleep $interval
done

while true; do
	echo checking crit
	current=$(get_current)
	if [ $current -le $critical ]; then
		notify-send \
			-u critical \
			-i /usr/share/icons/Mint-X/status/48/battery_caution.png \
			"Battery Critical" \
			"Your battery is at ${current}%"
		exit
	fi
	sleep $interval
done

