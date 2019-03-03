#!/bin/bash

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
#|======= Bud's Ultimate Quality of Life Install Script for ==============|
#|=======        General Use and Gaming =========|
#|=======			on Ubuntu 18.10 		 =========|
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|

#===========================================
# Set "minimize-on-click" for Launcher Icons
#============================================

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

#===================================================================|
# | Add 32-Bit Architecture support |				    |
#===================================================================|

sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y upgrade

#========================
#///-Add Repositories-\\\
#========================

sudo add-apt-repository -y ppa:tkashkin/gamehub
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:teejee2008/ppa

#==========================================================================================
# ********* Install Proprietary Nvidia Graphics Drivers or ***********
# ************** Bleeding-edge Mesa Graphics Stack *******************
# ******************* based on lsmod output **************************
#==========================================================================================

amdInstall () 
{
    echo "amdgpu Kernel module found! Installing graphics drivers from Padoka PPA..."
    sudo add-apt-repository -y ppa:paulo-miguel-dias/mesa
    sudo apt-get update
    sudo apt-get -y upgrade ;
}

nvidiaInstall ()
{
    echo "nouveau Kernel module found! Installing from graphics-drivers PPA..."
    sudo apt-add-repository -y ppa:graphics-drivers/ppa
    sudo apt-get update
    sudo apt-get -y install nvidia-drivers-415 ;
}

driverResult=$(lspci -nnk | grep -iA2 vga)

if [[ "$driverResult" == *"amdgpu"* ]]
then
    amdInstall
elif [[ "$driverResult" == *"nouveau"* ]]
then
    nvidiaInstall
else
    echo "No compatible Kernel module found! Skipping..."
fi


#=============
# BalenaEtcher #rewrite to check for latest version instead
#=============

mkdir ~/Documents/BalenaEtcher
cd ~/Documents/BalenaEtcher
wget https://github.com/balena-io/etcher/releases/download/v1.5.0/balena-etcher-electron-1.5.0-linux-x64.zip
sudo unzip balena-etcher-electron-1.5.0-linux-x64.zip
cd ~/

#========
# Lutris
#========

ver=$(lsb_release -sr); if [ $ver != "18.10" -a $ver != "18.04" -a $ver != "16.04" ]; then ver=18.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q https://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -

#==========================
# Wine-Staging (from WineHQ)
#==========================

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main'
sudo apt update

sudo apt install -y --install-recommends winehq-staging

#--------------------------------------------------------------------------|
# | Install applications (from Ubuntu-Cosmic, Bionic, Xenial repositories) |
#--------------------------------------------------------------------------|

sudo apt update

sudo apt -y install \
audacity \
audacious \
chrome-gnome-shell \
com.github.tkashkin.gamehub \
discord \
dhewm3 \
dolphin \
gnome-tweak-tool \
gnome-shell-extensions \
gnome-twitch \
grub-customizer \
filezilla \
htop \
lutris \
minetest \
multimc \
nautilus-dropbox \
obs-studio \
steam \
quake \
quake3 \
ukuu \
vlc \
xscreensaver \
xscreensaver-data \
xscreensaver-data-extra \
xscreensaver-gl \
xscreensaver-gl-extra

#================
# Yamagi Quake 2
#================

sudo snap -y install yamagi-quake2-beidl



