#!/bin/bash

# Disk bölümünün yolu
disk="/dev/nvme0n1p2"

# Diskin kullanılan alanını ve toplam alanını al
disk_used=$(df -h | grep "$disk" | awk '{print $3}')
disk_total=$(df -h | grep "$disk" | awk '{print $2}')

echo "💾 $disk_used / $disk_total"

