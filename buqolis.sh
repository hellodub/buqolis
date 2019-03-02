#!/bin/bash

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
#|======= Bud's Ultimate Quality of Life Install Script for 	 =========|
#|======= General Use and Gaming (AMD/AMD+Vega with Kernel 4.20+)=========|
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

driver_result=$(lspci -nnk | grep -iA2 vga)
	



sudo add-apt-repository -y ppa:paulo-miguel-dias/mesa
sudo apt update

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

#audacity (free sound editor)
#audacious (winamp-like audio player for linux)
#discord
#dhewm3 (Source port of Doom 3)
#dolphin (gamecube emulator)
#filezilla
#game-data-packager (terminal application to package game-files into installable .deb file for ubuntu)
#gamehub
#gnome-tweak-tool (customize gnome desktop)
#gnome-shell-extensions (extensions to enable through gnome-tweak-tool)
#gnome-twitch (twitch browser)
#grub-customizer (customize grub boot menu theme)
#htop (terminal process monitor)
#innoextract (attachment for game-data-packager)
#lutris
#lgogdownloader (attachment for game-data-packager to download purchased games from gog.com)
#minetest (free minecraft-clone)
#multimc (modded minecraft installer and launcher)
#nautilus-dropbox
#obs-studio (popular streaming app)
#steam
#quake (Only sets up engine, does not include game files)
#quake2 (Yamagi QuakeII engine, no game files) **Snap Version**
#quake3 (ioquake3 engine, no game files)
#ukuu
#vlc
#xscreensaver

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
libvulkan1 \
libvulkan1:i386 \
lutris \
mesa-vulkan-drivers
minetest \
multimc \
nautilus-dropbox \
obs-studio \
steam \
quake \
quake3 \
ukuu \
vlc \
vulkan-utils \
xscreensaver \
xscreensaver-data \
xscreensaver-data-extra \
xscreensaver-gl \
xscreensaver-gl-extra

#================
# Yamagi Quake 2
#================

sudo snap -y install yamagi-quake2-beidl



