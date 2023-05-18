#!/bin/bash

# 1 - Kuruluma başlamadan önce cfdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - curl https://bandolerotr.github.io/arch-script/arch-iso-dualboot.sh -o a.sh
# 3 - chmod +x a.sh
# 4 - ./a.sh

loadkeys trq
timedatectl set-ntp true

mkswap /dev/sda6
swapon /dev/sda6
mkfs.ext4 /dev/sda7

mount /dev/sda6 /mnt

rm -r /etc/pacman.d/gnupg
pkill gpg-agent
pacman-key --init
pacman-key --populate archlinux

pacman -Sy

pacman -S archlinux-keyring git

pacstrap /mnt base linux-zen linux-firmware 

genfstab -U /mnt >> /mnt/etc/fstab

mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

git clone https://github.com/BandoLeroTr/arch-script.git
cp -r arch-script /mnt

arch-chroot /mnt
