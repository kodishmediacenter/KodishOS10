#!/bin/bash

pacman -S kodi
pacman -S wget 
pacman -S git
pacman -S firefox
pacman -S lightdm
pacman -S lightdm-gtk-greeter
systemctl enable lightdm.service
pacman -S openbox
pacman -S xfce-panel
pacman -S thunar
pacman -S mousepad
pacman -S xterm
pacman -S jq 
pacman -S kitty
pacman -S xorg-xrandr
pacman -S arandr
pacman -S feh
pacman -S flatpak
flatpak install com.google.Chrome
flatpak install com.obsproject.Studio
flatpak install com.stremio.Stremio


mkdir /home/kodish/.config/bing
cd  /home/kodish/.config/bing
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/bing.sh
chmod +x bing.sh

mkdir /home/kodish/.config/openbox
cd   /home/kodish/.config/openbox
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/autostart



