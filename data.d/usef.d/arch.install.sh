#/bin/bash

# Only for ArchLinux-5.11.16+ [BIOS]

# ========================= install ========================== #
# 1.step: check boot way
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
# only for reference:
# [new] -> [type]-> [write]
# disk        size   type             mnt
# /dev/sda1   512M   Linux filesystem [/boot]
# /dev/sda2   40G    Linux filesystem [/]
# /dev/sda3   64G    Linux filesystem [/home]

mkfs.ext2 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home

# Add swap partition if ramdisk less than 4G
# disk        size   type             mnt
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
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
LANG=en_US.UTF-8
echo arch > /etc/hostname
passwd # set password
pacman -S iwd dialog netctl sudo vim
echo "set bell-style none" >> /etc/inputrc

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
systemctl start  systemd-resolved dhcpcd iwd

# 2.step: zone & host
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

vim /etc/hosts
# ===============================
# 127.0.0.1 localhost
# ::1 localhost
# 127.0.1.1 arch.localdomain arch
# ===============================

# 3.step: add group/user
groupadd -g 1248 stargazer
useradd -m -g stargazer -G wheel -s /bin/bash -d /home/aylax aylax
passwd aylax
echo "aylax ALL=(ALL) ALL" >> /etc/sudoers


# ==================== driver ====================== #
# {{{Fix wlan0 not found & if echo  BCM43142 802.11b/g/n (rev 0)
lspci -k | grep -A 2 -i network

vim /etc/pacman.conf
# ===============================
# [archlinuxcn]
# Server=http://repo.archlinuxcn.org/$arch
# ===============================

pacman -Syy
pacman -S archlinuxcn-keyring
pacman -S yaourt linux-headers
yaourt -S broadcom-wl-dkms
# reboot
# }}}

# {{{Fix bluetooth not found 
dmesg | grep -i blue | grep BCM
# Download BCM43142A0-105b-e065.hcd
# https://github.com/winterheart/broadcom-bt-firmware
mv BCM43142A0-105b-e065.hcd /lib/firmware/brcm/
# reboot
# }}}

# ==================== x-window ====================== #
# {{{ Card
lspci  | grep -i vga 
pacman -S xf86-video-intel # Intel
# }}}

pacman -S xorg-server xorg-xinit i3-gaps
pacman -S firefox rofi ranger rxvt-unicode
pacman -S adobe-source-code-pro-fonts
cp /etc/X11/xinit/xinitrc ~/.xinitrc

vim ~/.xinitrc 
# ===============================
## do comment 
## from :Line twn&
## to :Line exec xterm...
# exec i3
startx # to x-window
# ===============================


# ==================== aylax ====================== #

# clone aylax-dothub.d && init home context
pacman -S git wget openssh
ssh-keygen
# git confg --global user.email youremail
# git confg --global user.name yourname
# copy $HOME/.ssh/id_rsa.pub 
# to github.com/user/setting/sshkey
cd $HOME
git clone git@github.com:AyLax/dothub.d.git
sh dothub.d/font.d/install.sh
sh dothub.d/neovim.d/install.sh

# install neovim
pacman -S neovim
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py && rm get-pip.py
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.bashrc
pip install pynvim

# install urxvt
pacman -S urxvt

vim $HOME/.Xresources
# ===============================
# URxvt.scrollBar:False
# URxvt.scrollBar_right: false
# URxvt.inheritPixmap:true
# URxvt.borderLess:False
# Xft.dpi:96
# 
# 
# URxvt.depth: 32
# URxvt.internalBorder: 24
# URxvt.cursorBlink: true
# URxvt.cursorUnderline: false
# URxvt.saveline: 2048
# 
# URxvt.keysym.Shift-Up: command:\033]720;1\007
# URxvt.keysym.Shift-Down: command:\033]721;1\007
# URxvt.keysym.Control-Up: \033[1;5A
# URxvt.keysym.Control-Down: \033[1;5B
# URxvt.keysym.Control-Right: \033[1;5C
# URxvt.keysym.Control-Left: \033[1;5D
# 
# URxvt.iso14755: False
# 
# URxvt.font:xft:Monaco:antialias=True:pixelsize=16, \
# xft:PingFangSC-Regular:antialias=True:pixelsize=16
# URxvt.boldfont:xft:Monaco:antialias=True:pixelsize=16, \
# xft:PingFangSC-Regular:antialias=True:pixelsize=16
# 
# 
# ! special
# *.foreground:   #ffffff
# *.background:   #2b2836
# *.cursorColor:  #ff2800
# 
# ! black
# *.color0:       #251f1f
# *.color8:       #251f1f
# 
# ! red
# *.color1:       #ff2800
# *.color9:       #ff2800
# 
# ! green
# *.color2:       #ff5000
# *.color10:      #ff5000
# 
# ! yellow
# *.color3:       #ff7800
# *.color11:      #ff7800
# 
# ! blue
# *.color4:       #ffa000
# *.color12:      #ffa000
# 
# ! magenta
# *.color5:       #ffc800
# *.color13:      #ffc800
# 
# ! cyan
# *.color6:       #fff000
# *.color14:      #fff000
# 
# ! white
# *.color7:       #ff0200
# *.color15:      #ff0000
# ===============================

# config Second Output Screen
pacman -S xorg-xrandr
xrandr # if not found exec xorg-xrandr
xrandr --output HDMI-1 --mode 1920x1080 # output second screen
xrandr --output eDP-1 --off # off current screen



