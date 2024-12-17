#!/bin/bash
loadkeys br-abnt2
pacman -Sy
pacman -S dos2unix
fdisk -l /dev/sda
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2 
mount /dev/sda2 /mnt 
mkdir /mnt/boot
mkdir /mnt/boot/efi
pacstrap /mnt base base-devel linux linux-firmware nano vim dhcpcd
genfstab -U -p /mnt >> /mnt/etc/fstab
mkdir /mnt/kodish
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/chroot.sh
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/source.sh
dos2unix chroot.sh
dos2unix source.sh
arch-chroot /mnt
