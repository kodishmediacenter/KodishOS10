#!/bin/bash
loadkeys br-abnt2
pacman -Sy
pacman -S dos2unix
cfdisk
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2 
mount /dev/sda2 /mnt 
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot
pacstrap /mnt base base-devel linux linux-firmware nano vim dhcpcd
genfstab -U -p /mnt >> /mnt/etc/fstab
pacman -Scc
mkdir /mnt/kodish
cd /mnt/kodish
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/chroot.sh
wget https://raw.githubusercontent.com/kodishmediacenter/KodishOS10/refs/heads/main/source.sh
dos2unix chroot.sh
dos2unix source.sh
arch-chroot /mnt
