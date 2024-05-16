icon=


value=$(/bin/sh -c "cat /sys/class/power_supply/BAT1/capacity")

echo "$icon  $value"
