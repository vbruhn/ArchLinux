#!/bin/bash

# run this script after mounting the partitions

# configure the morrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
nano /etc/pacman.d/mirrorlist

# install the base-system
pacstrap /mnt base base-devel intel-ucode bash-completion
# With WiFi:
# pacstrap /mnt base base-devel intel-ucode bash-completion wpa_supplicant dialog

# create fstab
genfstab -U /mnt > /mnt/etc/fstab
nano /mnt/etc/fstab

arch-chroot /mnt/
