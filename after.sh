#!/bin/bash

clear

mkdir test
cd test

mkdir ~/Belgeler
mkdir ~/İndirilenler
mkdir ~/Müzik
mkdir ~/Resimler
mkdir ~/Videolar
mkdir ~/Games

curl https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1 -o ~/Resimler/bg.jpg

sudo pacman -S pulseaudio pulsemixer pavucontrol \
	ristretto rofi picom feh zsh git \
	xfce4-terminal xorg-xrandr\
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer file-roller \
	firefox \
	neovim \
	lxappearance \
	awesome-terminal-fonts ttf-liberation gnu-free-fonts ttf-hack-nerd

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
yay -S autotiling 

git clone https://github.com/BandoLeroTr/arch-script.git
cd arch-script
rm -r ~/.config
mv yeni ~/.config
feh --bg-fill ~/Resimler/bg.jpg
i3-msg restart

#neovim
