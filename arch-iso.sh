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

pacstrap /mnt archlinux-keyring base linux-zen linux-firmware neovim \
    grub efibootmgr networkmanager sudo \
    xorg i3 xfce4-terminal lightdm lightdm-gtk-greeter pulseaudio pavucontrol \
    base-devel git zip unzip gvfs-mtp brightnessctl picom nitrogen rofi thunar thunar-archive-plugin lxappearance firefox ristretto file-roller \
    alsa-utils awesome-terminal-fonts zsh steam ttf-liberation nodejs yarn python-pip scrot ffmpegthumbnailer xfce4-clipman-plugin xfce4-taskmanager \
    xfce4-screenshooter weston gnu-free-fonts ttf-hack-nerd ntfs-3g os-prober

genfstab -U /mnt >> /mnt/etc/fstab

git clone https://github.com/BandoLeroTr/arch-script.git
cp -r arch-script /mnt

arch-chroot /mnt
