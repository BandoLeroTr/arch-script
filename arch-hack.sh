#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
echo tr_TR.UTF-8 UTF-8 >> /etc/locale.gen
echo LANG="tr_TR.UTF-8" >> /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf
echo archlinux >> /etc/hostname
echo 127.0.0.1          localhost >> /etc/hosts
echo ::1                localhost >> /etc/hosts
locale-gen

echo [multilib] >> /etc/pacman.conf
echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

pacman -Sy

pacman -S grub efibootmgr networkmanager sudo

pacman -S xorg i3 xfce4-terminal xfce4-taskmanager lightdm lightdm-gtk-greeter base-devel git zip unzip rofi thunar thunar-archive-plugin lxappearance firefox ristretto file-roller awesome-terminal-fonts zsh

mkinitcpio -P
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch

grub-mkconfig -o /boot/grub/grub.cfg

useradd -m bandolero

echo ######## root passwd #######
passwd

echo ######## user passwd ########
passwd bandolero

echo bandolero 'ALL=(ALL:ALL) ALL' >> /etc/sudoers
#######################################################################################
git clone https://github.com/BandoLeroTr/arch-script.git
cd arch-script

mv config .config

cp -r .config /home/bandolero/
#############################################
cd themes
tar xf Tela-circle-red.tar.xz
unzip Qogir-dark.zip
tar xf Pax-GTK.tar.gz

cp -r Tela-circle-red /usr/share/icons #folder icon
cp -r Qogir-dark /usr/share/icons #cursor icon
cp -r Pax-GTK /usr/share/themes #all color
cd ..
#############################################
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp vimrc .vimrc
cp .vimrc /home/bandolero/
#######################################################################################
cp xorg/00-keyboard.conf /etc/X11/xorg.conf.d/
#######################################################################################
cp -r .config/rofi/* /usr/share/rofi/themes/
#######################################################################################
systemctl enable NetworkManager
systemctl enable lightdm
#######################################################################################
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -r /root/.oh-my-zsh /home/bandolero

cp -r bandolero /home/bandolero/.oh-my-zsh/plugins/
cp robbyrussell.zsh-theme /home/bandolero/.oh-my-zsh/themes/

cp zshrc .zshrc
cp .zshrc /home/bandolero/
#######################################################################################
echo umount -R /mnt     
echo reboot
exit
