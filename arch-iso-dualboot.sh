#!/bin/bash

# 1 - Kuruluma başlamadan önce cfdisk /dev/sda ile disk bölümleme işlemini yapın. 
# 2 - curl https://bandolerotr.github.io/arch-script/arch-iso-dualboot.sh -o a.sh
# 3 - chmod +x a.sh
# 4 - ./a.sh

loadkeys trq
timedatectl set-ntp true

mkswap /dev/sda5
swapon /dev/sda5
mkfs.ext4 /dev/sda6

mount /dev/sda6 /mnt

#pacman-key --init
#pacman-key --populate archlinux

pacman -Sy

pacman -S archlinux-keyring git

pacstrap /mnt base linux-zen linux-firmware neovim 

genfstab -U /mnt >> /mnt/etc/fstab

mkdir /mnt/boot/efi
mount /dev/sda2 /mnt/boot/efi

git clone https://github.com/BandoLeroTr/arch-script.git
cp -r arch-script /mnt

arch-chroot /mnt
