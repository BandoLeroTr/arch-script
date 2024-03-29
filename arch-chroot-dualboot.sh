#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
echo tr_TR.UTF-8 UTF-8 >> /etc/locale.gen
echo LANG="tr_TR.UTF-8" >> /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf
echo archlinux >> /etc/hostname
echo 127.0.0.1		localhost >> /etc/hosts
echo ::1		    localhost >> /etc/hosts
locale-gen

echo [multilib] >> /etc/pacman.conf
echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

pacman -Sy

pacman -S grub efibootmgr networkmanager sudo
pacman -S os-prober ntfs-3g
pacman -S xorg i3 lightdm lightdm-gtk-greeter pulseaudio pavucontrol rofi \
    xfce4-terminal xfce4-clipman-plugin xfce4-screenshooter xfce4-taskmanager \
    thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer \
    steam wine winetricks lutris \
    neovim xed \
    mpv ristretto gimp obs-studio \
    base-devel git zip unzip gvfs-mtp brightnessctl picom nitrogen lxappearance file-roller \
    alsa-utils zsh nodejs yarn python-pip scrot weston \
    awesome-terminal-fonts ttf-liberation gnu-free-fonts ttf-hack-nerd

#modprobe vboxdrv

#pacman -S wine lutris wireshark virtualbox linux-headers php telegram-desktop

echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub

mkinitcpio -P
grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
#LC_ALL=C /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg

#clear

useradd -m bandolero

echo ######## root passwd #######
passwd

echo ######## user passwd ########
passwd bandolero

echo bandolero 'ALL=(ALL:ALL) ALL' >> /etc/sudoers
#######################################################################################
git clone https://github.com/BandoLeroTr/arch-script.git
cd arch-script
############################################
cd themes

tar xf candy-icons.tar.xz
unzip Qogir-dark.zip
tar xf Breeze-Noir-Dark-GTK.tar.gz

cp -r candy-icons /usr/share/icons #folder icon
cp -r Qogir-dark /usr/share/icons #cursor icon
cp -r Breeze-Noir-Dark-GTK /usr/share/themes #all color

cd ..
#######################################################################################
cp xorg/00-keyboard.conf /etc/X11/xorg.conf.d/
#######################################################################################
cp -r rofi/* /usr/share/rofi/themes/
#######################################################################################
systemctl enable NetworkManager
systemctl enable lightdm

#echo umount -R /mnt     
#echo reboot
exit
