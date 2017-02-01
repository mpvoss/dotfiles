#!/bin/bash

# This script copies the dot files from the repo to their right place on a ubuntu system

.Xresources

cp ../i3config/ ~/.i3/config
cp ../i3blocks ~/.i3/i3blocks
cp ../compton.conf ~/.config

cp ../rofi.conf /etc/rofi.conf


# Installs

# Compton
sudo apt-add-repository ppa:richardgv/compton
sudo apt-get install compton

sudo apt-get install rofi

sudo apt-get install j4-dmenu-desktop

sudo apt-get install i3bar i3 blocks i3status


# Start it up
i3reload
