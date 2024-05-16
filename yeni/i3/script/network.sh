#!/bin/bash

interface="wlan0"

start_bytes=$(cat "/sys/class/net/$interface/statistics/rx_bytes")
sleep 1 # 1 saniye bekle
end_bytes=$(cat "/sys/class/net/$interface/statistics/rx_bytes")

# İndirme hızını hesapla
download_speed=$(echo "scale=2; ($end_bytes - $start_bytes) / 1000000" | bc)

# Birimi belirle
if (( $(echo "$download_speed > 1" | bc -l) )); then
    unit="Mbps"
else
    download_speed=$(echo "$download_speed * 1000" | bc)
    unit="Kbps"
fi

echo "$download_speed $unit"

