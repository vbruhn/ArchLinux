#!/bin/bash

# change names to your preferences
echo voulxware > /etc/hostname
echo LANG=de_DE.UTF-8 > /etc/locale.conf
nano /etc/locale.gen
locale-gen
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# uncomment multilib for 32-bit libraries
nano /etc/pacman.conf
pacman -Sy

mkinitcpio -p linux

passwd

pacman -S efibootmgr dosfstools gptfdisk

#GRUB:
pacman -S grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck --debug
mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg

# efibootmgr -q -c -d /dev/sdX -p 1 -w -L "GRUB: Arch-Linux" -l '\EFI\arch_grub\grubx64.efi'
exit   # auslogen von arch-chroot 
umount -R /mnt
reboot
