#!/bin/bash

# Ekran parlaklığını al
brightness=$(xbacklight -get | awk '{printf "%.0f\n", $1}')

# İkonu ve parlaklığı göster
echo "$brightness"

# Parlaklığa tıklandığında, xbacklight ile parlaklığı arttır
case $BLOCK_BUTTON in
    1) xbacklight -inc 10;;
    3) xbacklight -dec 10;;
esac

