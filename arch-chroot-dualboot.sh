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
    steam \
    neovim xed \
    mpv ristretto gimp obs-studio \
    firefox \
    base-devel git zip unzip gvfs-mtp brightnessctl picom nitrogen lxappearance file-roller \
    alsa-utils zsh nodejs yarn python-pip scrot weston \
    awesome-terminal-fonts ttf-liberation gnu-free-fonts ttf-hack-nerd \
    ntfs-3g
#anbox-modules-dkms-git r46.ae26ba2-1
#android-cmake-git r147.556cc14-1
#android-ndk r25.c-1
#android-platform 33_r02-1
#android-sdk 26.1.1-2
#android-sdk-build-tools r33.0.2-1
#android-sdk-cmdline-tools-latest 9.0-1
#android-sdk-platform-tools 33.0.3-1
#android-studio 2022.1.1.21-1
#autotiling 1.8-1
#flutter 3.7.6-1
#google-chrome 111.0.5563.64-1
#libgbinder 1.1.32-1
#libglibutil 1.0.68-1
#python-gbinder 1.1.1-2
#python-repath 0.9.0-1
#vscodium-bin 1.75.1.23040-1
#waydroid 1.4.1-1
#yay 11.3.2-1

#modprobe vboxdrv

#pacman -S wine lutris wireshark virtualbox linux-headers php telegram-desktop

echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub

mkinitcpio -P
grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
LC_ALL=C /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"

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
