#!/bin/bash

# 1 - Kuruluma başlamadan önce cfdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - curl https://bandolerotr.github.io/arch-script/arch-iso.sh -o arch-iso.sh
# 3 - chmod +x arch-iso.sh
# 4 - ./arch.sh

loadkeys trq
timedatectl set-ntp true

mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
swapon /dev/sda2

#pacman-key --init
#pacman-key --populate archlinux

pacman -Sy

pacman -S archlinux-keyring git

pacstrap /mnt base linux-zen linux-firmware neovim 

genfstab -U /mnt >> /mnt/etc/fstab

mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

git clone https://github.com/BandoLeroTr/arch-script.git
cp -r arch-script /mnt

arch-chroot /mnt
