#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
echo tr_TR.UTF-8 UTF-8 >> /etc/locale.gen
echo LANG="tr_TR.UTF-8" >> /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf
echo archlinux >> /etc/hostname
echo 127.0.0.1		localhost >> /etc/hosts
echo ::1		localhost >> /etc/hosts
locale-gen

echo [multilib] >> /etc/pacman.conf
echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

pacman -Sy

pacman -S grub efibootmgr networkmanager sudo

pacman -S xorg i3 xfce4-terminal xfce4-clipman-plugin xfce4-taskmanager xfce4-screenshooter lightdm lightdm-gtk-greeter pulseaudio pavucontrol base-devel git zip unzip gvfs-mtp brightnessctl picom nitrogen rofi thunar thunar-archive-plugin lxappearance firefox htop ristretto file-roller alsa-utils awesome-terminal-fonts zsh steam steam-native-runtime

mkinitcpio -P
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch

grub-mkconfig -o /boot/grub/grub.cfg

#clear

useradd -m bandolero

echo ######## root passwd #######
passwd

echo ######## user passwd ########
passwd bandolero

echo bandolero 'ALL=(ALL:ALL) ALL' >> /etc/sudoers
#######################################################################################
rm -r /home/bandolero/.config

git clone https://github.com/BandoLeroTr/arch-script.git
cd arch-script

mv config .config

cp -r .config /home/bandolero
#############################################
cd themes
tar xf Tela-circle-manjaro.tar.gz
unzip Qogir-dark.zip
unzip Pax-GTK.zip

cp -r Tela-circle-manjaro /usr/share/icons #folder icon
cp -r Qogir-dark /usr/share/icons #cursor icon
cp -r Pax-GTK /usr/share/themes #all color
cd ..
#############################################
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv vimrc .vimrc
cp .vimrc ~/.vimrc
cp xorg/00-keyboard.conf /etc/X11/xorg.conf.d/
#######################################################################################
systemctl enable NetworkManager
systemctl enable lightdm
clear

#echo umount -R /mnt     
#echo reboot
