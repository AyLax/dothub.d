#/bin/bash

# Only for ArchLinux-5.11.16+

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

# 4.step parted disk
lsblk # info it
cfdisk /dev/sdx # part sdx
# [new] -> [type]-> [write]
# only for reference:
# disk        size   type
# /dev/sda1   120M   EFI system 
# /dev/sda2   40G    Linux filesystem [/root]
# /dev/sda3   64G    Linux filesystem [/home] 
# /dev/sda4   4G     linuxswap        [swap]


