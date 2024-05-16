#!/bin/bash

# Total memory
#total_mem=$(free -h | awk '/^Mem:/ {print $2}')
#
## Used memory
#used_mem=$(free -h | awk '/^Mem:/ {print $3}')
#
## Memory percentage
#
#echo "💾 $used_mem / $total_mem "

used_mem=$(free -m | awk 'NR==2 {print $3}')

# MB cinsinden kullanılan belleği GB cinsine dönüştür
used_mem_gb=$(echo "scale=2; $used_mem / 1024" | bc)

echo "Mem: $used_mem GB"

