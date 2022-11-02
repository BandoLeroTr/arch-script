import os

os.system("ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime")

os.system("hwclock --systohc")

os.system("echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen")
os.system("echo "tr_TR ISO-8859-9" >> /etc/locale.gen")

os.system("echo 'LANG="tr_TR.UTF-8"' >> /etc/locale.conf")

os.system("echo "KEYMAP=trq" >> /etc/vconsole.conf")

os.system("echo "archlinux" >> /etc/hostname")

os.system("echo "127.0.0.1	localhost" >> /etc/hosts")
os.system("echo "::1		localhost" >> /etc/hosts")
os.system("locale-gen")

os.system("pacman -S grub efibootmgr networkmanager")

os.system("pacman -S xorg-server xorg-apps i3 xfce4-terminal xfce4-clipman-plugin xfce4-taskmanager lightdm lightdm-gtk-greeter") 

os.system("pacman -S pulseaudio pavucontrol intel-ucode base-devel git zip unzip udisks2 gvfs-mtp brightnessctl")

os.system("pacman -S picom nitrogen rofi thunar lxappearance") #vivaldi htop opera

os.system("systemctl enable NetworkManager")
os.system("systemctl enable lightdm")

os.system("mkinitcpio -P")
os.system("mkdir /boot/efi")
os.system("mount /dev/sda1 /boot/efi")
os.system("grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch")

os.system("grub-mkconfig -o /boot/grub/grub.cfg")

os.system("clear")

echo umount -R /mnt     
echo reboot



