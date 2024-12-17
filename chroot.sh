#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
pacman -S nano

LOCALE_GEN="/etc/locale.gen"

# Verifica se o arquivo existe
if [[ -f "$LOCALE_GEN" ]]; then
    # Descomenta as linhas específicas
    sed -i 's/^# *\(pt_BR.UTF-8 UTF-8\)/\1/' "$LOCALE_GEN"
    sed -i 's/^# *\(pt_BR ISO-8859-1\)/\1/' "$LOCALE_GEN"

    echo "Linhas pt_BR.UTF-8 e pt_BR ISO-8859-1 descomentadas no locale.gen"
else
    echo "Erro: Arquivo locale.gen não encontrado em $LOCALE_GEN"
    exit 1
fi

locale-gen
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf
hostnamectl set-hostname kodish-htpc

passwd
useradd -m -g users -G wheel,storage,power -s /bin/bash kodish
passwd kodish

pacman -S dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant wireless_tools dialog
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg


