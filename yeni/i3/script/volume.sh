#!/bin/bash

volume=$(pulsemixer --get-volume | awk '{print $1}')

if [ "$BLOCK_BUTTON" = "1" ]; then
	pulsemixer --change-volume +5

elif [ "$BLOCK_BUTTON" = "3" ]; then
	pulsemixer --change-volume -5
fi

if [ $volume -eq 0 ]; then
	icon=

elif [ $volume -lt 50 ]; then
	icon=

else
	icon=
fi
echo "$icon  $volume" 
