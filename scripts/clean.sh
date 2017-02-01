#!/bin/bash

# This script copies the dot files from the repo to their right place on a ubuntu system

rm ~/.Xresources
rm -rf ~/i3
rm ~/.config/compton.conf
sudo rm /etc/rofi.conf


sudo add-apt-repository --remove ppa:richardgv/compton
sudo apt-get remove i3bar i3blocks i3status j4-dmenu-desktop rofi compton
