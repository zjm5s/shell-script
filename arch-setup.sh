#!/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
##设置主机名
echo zjm5s > /etc/hostname
echo 127.0.0.1	localhost.localdomain	localhost > /etc/hosts
echo ::1		localhost.localdomain	localhost >> /etc/hosts
echo 127.0.1.1	myhostname.localdomain	myhostname >> /etc/hosts
##无线配置,安装所需软件
pacman -S iw wpa_supplicant dialog
##安装grub
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
##安装intel微码
pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg
##完成
pacman -S zsh
echo pless setup root passwd
