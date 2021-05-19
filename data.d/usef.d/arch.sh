#/bin/bash

# Only for ArchLinux-5.11.16+ [BIOS]

## 1.step: check boot way
# check boot: if dictionary exists; then efi else maybe bios
ls /sys/firmware/efi/efivars

# 2.step: connect network
iwctl # connect wifi
# [iwd#] device list
# [iwd#] station wlan0 scan
# [iwd#] station wlan0 get-networks
# [iwd#] station wlan0 connect wifiname
# [iwd#] exit 
ping.archlinux.org # test connect

# 3.step: sync time
timedatectl set-ntp true
timedatectl status

# 4.step: update mirrors
reflector -c China -a 6 --sort rate --save  /etc/pacman.d/mirrorlist
pacman -Syy

# 5.step: parted disk
lsblk # info it
cfdisk /dev/sdx # part sdx
# [new] -> [type]-> [write]
# only for reference:
# disk        size   type
# /dev/sda1   512M  Boot
# /dev/sda2   40G    Linux filesystem [/]
# /dev/sda3   64G    Linux filesystem [/home]
mkfs.ext2 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mkdir /mnt/home
mount /dev/sda3 /mnt/home

# 6.step: install system
pacstrap /mnt base linux linux-firmware vim

# 7.step: gen partition table
genfstab -U /mnt >> /mnt/etc/fstab


arch-chroot /mnt
