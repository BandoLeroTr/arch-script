#!/bin/bash

# 1 - Kuruluma başlamadan önce cfdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - curl https://bandolerotr.github.io/arch-script/arch-iso.sh -o arch-iso.sh
# 3 - chmod +x arch-iso.sh
# 4 - ./arch.sh

loadkeys trq
timedatectl set-ntp true

mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda6

mount /dev/sda3 /mnt
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

#pacman-key --init
#pacman-key --populate archlinux

pacman -Sy

pacstrap /mnt archlinux-keyring base linux-zen linux-firmware neovim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
