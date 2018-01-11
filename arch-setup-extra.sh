#!/bin/bash
pacman -S xf86-video-intel vulkan-intel xorg-server
pacman -S plasma kde-applications
systemctl enable sddm
pacman -S chromium shadowsocks proxychains
pacman -S ttf-dejavu
pacman -S wqy-zenhei
##中文化
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
echo zh_CN.UTF-8 UTF-8 >> /etc/loclae.gen
locale-gen
echo export LANG=zh_CN.UTF-8 > .xprofile
echo export LANGUAGE=zh_CN:en_US >> .xprofile
echo export LC_CTYPE=en_US.UTF-8 >> .xprofile
pacman -S fcitx-im kcm-fcitx
##AUR

