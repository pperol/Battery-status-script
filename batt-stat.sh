#!/bin/bash
export DISPLAY=:0
battery_level=`acpi -b | head -1 | grep -Po '[0-9]+(?=%)'`
ac_power=`cat /sys/class/power_supply/ADP0/online`
if [ $ac_power -eq 0 ]; then
	if [ $battery_level -le 20 ]; then
		/usr/bin/notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}% "
		/usr/bin/paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
	fi
elif  [ $ac_power -eq 1 ]; then
	if [ $battery_level -ge 85 ]; then
		/usr/bin/notify-send --urgency=CRITICAL --icon=/usr/share/icons/Adwaita/16x16/legacy/battery-good.png "Optimal battery level reached" "Level: ${battery_level}%"
		/usr/bin/paplay /usr/share/sounds/freedesktop/stereo/complete.oga
	fi
else
	/usr/bin/notify-send --urgency=CRITICAL "Cannot determine whether AC power is ON or OFF."
fi
