#!/bin/bash

# 1 - Kuruluma başlamadan önce cgdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - chmod +x arch-iso.sh
# 3 - ./arch.sh

loadkeys trq
timedatectl set-ntp true

mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt

pacstrap /mnt base linux linux-firmware vim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
