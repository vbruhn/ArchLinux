#!/bin/bash

dhcpcd eno1

useradd -m -g users -s /bin/bash volker

passwd volker

#pacman -S sudo
nano /etc/sudoers
gpasswd -a volker wheel

chown -v volker /ArchLinux

pacman -S acpid dbus avahi cups cronie
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable org.cups.cupsd.service
systemctl enable cronie
systemctl enable --now systemd-timesyncd.service

pacman -S xorg-server xorg-xinit
pacman -S xf86-video-nouveau

localectl set-x11-keymap de pc105 nodeadkeys

pacman -S ttf-dejavu

pacman -S awesome feh rofi gnome gnome-extra

systemctl enable gdm


