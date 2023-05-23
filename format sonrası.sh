#!/bin/bash

git clone https://github.com/bandolerotr/arch-script

mkdir ~/Belgeler
mkdir ~/İndirilenler
mkdir ~/Müzik
mkdir ~/Resimler
mkdir ~/Videolar
mkdir ~/Games
#######################################################################################
# Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#######################################################################################
# Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd arch-script
cp zshrc ~/.zshrc
#######################################################################################
mkdir ~/.config/nvim
rm ~/.config
cp -r config ~/.config
#######################################################################################
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

#yay -S timeshift
yay -S autotiling
