#!/bin/bash
disk=$1
#timedatectl set-ntp true
echo "plese wait"
echo ${disk}1
#格式化3个分区
mkfs.fat -F32 ${disk}1
mkfs.ext4 ${disk}2
mkfs.ext4 ${disk}3
#挂载
mount ${disk}2 /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount ${disk}1 /mnt/boot
mount ${disk}3 /mnt/home
#选择镜像
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlis
cat /etc/pacman.d/mirrorlis | grep ustc > /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlis | grep 163 >> /etc/pacman.d/mirrorlist
#安装
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
##安装至此结束，接下来配置系统
arch-chroot /mnt
