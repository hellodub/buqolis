# Bud's Ultimate Quality of Life Install Script 
- **(for Ubuntu 18.10)**

A bash script to install various applications and programs for a better quality of life experience for first time Linux users!
Eventually I plan on implementing this in probably a PyQT frontend to reduce cold-feet,
**plus it'll be cool, and _stuff_**

This is my first bash shell script of this size and proportion, and is **absolutely** a means to better improve my skills for this project and future projects. Please do **not** be afraid to point out improvements that can be done because that's the whole point!

## This is designed specifically for Ubuntu 18.10

But should work absolutely fine with 18.04, and possibly with 19.04. Most of the applications installed either _were_ shipped out for 18.04 or 18.10 in mind and will be updated accordingly should they and/or Ubuntu be upgraded to newer versions.

## Gaming (for AMD Polaris/Vega Cards or Nvidia Cards supported by Nvidia's Proprietary Drivers)

With the advent of DXVK, Valve's Proton and recent breakthroughs in WINE (all-related), gaming on Linux is now at a formidable point for a lot of people to ditch Windows and/or MacOS. However, there is still a _small_ amount of legwork to be done on a fresh install of Ubuntu to really help those folks brave enough to make the jump to really feel sound in their decision, as most people are deathly _terrified_ of using the terminal to do _anything_. Or they just want it to work straight-away. So regarding this, this script also contains that aforementioned legwork to get things for your DXVK, Proton, WINE, and native gaming experience on Linux ready. 

There are/will be bash functions to grab either the Padoka PPA for AMD graphics cards or the graphics-drivers PPA for Nvidia graphics cards based on a simple parsing of your **lsmod** output, looking for what kernel module is loaded at runtime. And based on this, it will either find "amdgpu" or "nouveau". If either or is found during the check, it will grab the appropriate PPA and drivers.

## Installed Packages and Programs

This is open for change, but these are the applications/packages that I always grab on a fresh install, and are nice to have and play around with, and/or are necessary for others to work. We're open to suggestions!

The list includes packages and programs from the main repository and PPA's

The list currently is:

- Audcacity
- Audacious
- chrome-gnome-shell
- GameHub
- Discord
- dhewm3
- dolphin
- gnome-tweak-tool
- gnome-shell-extensions
- gnome-twitch
- grub-customizer
- filezilla
- htop
- lutris
- minetest
- multimc
- nautilus-dropbox
- obs-studio
- steam
- quake
- quake3
- ukuu
- vlc
- xscreensaver

### Snap packages

This is open for debate too, I think snaps are fine, but we should prioritize the use of .deb verions first on the count of some of them being _really_ slow to launch the first time and/or theming/system integration being borked. Very few have had this problem in my experience but theming is almost always broken in some capacity

List of snaps to be installed currently:

yamagi-quake2-beidl
