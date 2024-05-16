#!/bin/bash    

current_date=$(date '+%A - %Y-%m-%d')

date '+%H:%M:%S'

if [ $BLOCK_BUTTON ]; then
	    zenity --info --text="$current_date"
fi

