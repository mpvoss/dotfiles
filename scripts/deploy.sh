#!/bin/bash

# This script copies the dot files from the repo to their right place on a ubuntu system

#####################################
# Config files
#####################################
cp ../.Xresources ~/

mkdir ~/.i3
cp ../i3config ~/.i3/config
sudo cp ../i3blocks ~/.i3/i3blocks
sudo cp ../compton.conf ~/.config
sudo cp ../.reddit-background ~/
sudo cp ../rofi.conf /etc/rofi.conf

#####################################
# Installing compton, rofi, j4...
#####################################
sudo apt-add-repository ppa:richardgv/compton
sudo apt-get update
sudo apt-get install compton

sudo apt-get install rofi

sudo apt-get install j4-dmenu-desktop

sudo apt-get install i3blocks i3status

#####################################
# Building, installing i3
#####################################

# Dependencies
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev

mkdir /tmp/i3_setup && cd /tmp/i3_setup
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
sudo apt-get install autoconf
autoreconf --force --install
rm -rf build/

mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd
sudo rm -rf /tmp/i3_setup
 
#####################################
# Reload i3
#####################################
i3 reload

#####################################
# Wallpapers
#####################################

# Dependency
sudo apt-get install python-xlib

mkdir /tmp/wallpaper_setup && cd /tmp/wallpaper_setup
git clone https://github.com/rconradharris/reddit-backgrounds.git
sudo cp -r reddit-backgrounds /usr/local/bin
cd ~/
sudo echo "0 9 * * * /usr/local/bin/reddit-background" | sudo tee /etc/cron.d/wallpaper
cd ~
rm -rf /tmp/wallpaper_setup


