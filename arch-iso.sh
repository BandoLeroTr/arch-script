#!/bin/bash

# 1 - Kuruluma başlamadan önce cfdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - curl https://bandolerotr.github.io/arch-script/arch-iso.sh -o arch-iso.sh
# 3 - chmod +x arch-iso.sh
# 4 - ./arch.sh

loadkeys trq
timedatectl set-ntp true

#mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda5
swapon /dev/sda5
mkfs.ext4 /dev/sda6

mount /dev/sda6 /mnt

#pacman-key --init
#pacman-key --populate archlinux

pacman -Sy

pacman -S archlinux-keyring 

pacstrap /mnt base linux-zen linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
