#/bin/bash

# Only for ArchLinux-5.11.16+ [BIOS]

# ========================= install ========================== #
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

# if ramdisk less than 4G maybe need it
# /dev/sda4   4G     Linux swap
# mkswap /dev/sda4
# swapon /dev/sda4

# 6.step: install system
pacstrap /mnt base base-devel dhcpcd linux linux-firmware

# 7.step: gen partition table
genfstab -U /mnt >> /mnt/etc/fstab


# 8.step: switch inner system
arch-chroot /mnt
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
passwd # set password
pacman -S iwd dialog netctl sudo vim

# 9.step save grub
pacman -S grub
grub-install  --no-floppy --target=i386-pc --force --recheck --debug /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount /mnt/{boot,home,}
reboot

# ==================== config ====================== #

# 1.step: wifi
systemctl enable systemd-resolved dhcpcd iwd
systemctl start systemd-resolved dhcpcd iwd

# 2.step: zone & host
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
vim /etc/hosts
# 127.0.0.1 localhost
# ::1 localhost
# 127.0.1.1 arch.localdomain arch

# 3.step: add group/user
groupadd －g 1248 stargazer
useradd -m -g stargazer -G wheel -s /bin/bash -d /home/aylax aylax
passwd aylax
echo "aylax ALL=(ALL) ALL" >> /etc/sudoers



# ==================== config ====================== #
# fix if wlan0 not found && echo is BCM43142 802.11b/g/n (rev 0)
lspci -k | grep -A 2 -i network
# {{{ if it is above then do
vim /etc/pacman.conf
# [archlinuxcn]
# Server=http://repo.archlinuxcn.org/$arch
pacman -Syy
pacman -S archlinuxcn-keyring
pacman -S yaourt linux-headers
yaourt -S broadcom-wl-dkms
reboot
# }}}

