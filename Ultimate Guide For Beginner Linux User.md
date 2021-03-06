#### Note
> You can use this as a guide if you are using *ubuntu or ubuntu based** distros.
> I think some of this will work to on **debian** distros

> If you see something like this `<name>` in the command, remove the brackets and replace it with what it says

> Read! Before copy and pasting

# Update & Upgrade Package
```bash
# update the repository
sudo apt update

# list all upgradable packages
apt list --upgradable

# upgrade specific packages or upgrade a single package
sudo apt --only-upgrade install gimp code kdenlive

# upgrade all packages
sudo apt upgrade
```
---

# Unpack `.deb` File
```bash 
# this will work mostly fine
sudo dpkg -i thefilename.deb

# using apt
sudo apt install ./thefilename.deb

# run this if you get any dependency errors
sudo apt install -f
```
---

# Extract `.tar.xz` File
https://linuxize.com/post/how-to-extract-unzip-tar-xz-file/
```bash
tar -xf archive.tar.xz
tar xf archive.tar.xz
tar xf archive.tar.gz
tar xf archive.tar
```
**If tar gives a Cannot exec error, you may need to run `sudo apt install xz-utils` first.**

### Installing from a `.tar` file
```bash
# if the file is .tar.gz
tar xvzf PACKAGENAME.tar.gz

# if the file is .tar.bz2
tar xvjf PACKAGENAME.tar.bz2

./configure
make
sudo make install
```
**see this for more info :** https://help.ubuntu.com/community/CompilingEasyHowTo

---

# How To Clone Git Repositories
`git clone <repository URL>`

Example : 
`git clone https://github.com/get543/linux-beginner-guide`

---

# Other Tips Tutorials
- [How to Dual Boot POP OS 20.04 LTS and Windows 10 - 2021](https://youtu.be/hbzCSjlbInY)
- [15 Best GNOME Extensions for Ubuntu (2021 Edition) - OMG! Ubuntu!](https://www.omgubuntu.co.uk/best-gnome-shell-extensions)
- [8 Irresistible Icon Sets for Ubuntu (2020 Edition)](https://www.omgubuntu.co.uk/best-icon-themes-ubuntu)
- [The 8 Best Linux Download Managers for Faster Downloads](https://www.makeuseof.com/best-download-managers-for-linux/)
- [Download Microsoft To Do](https://github.com/klaussinani/ao) [From Snap](https://snapcraft.io/install/microsoft-todo-unofficial/ubuntu)
- [10 Fun Linux Command-Line Programs You Should Try When Bored](https://www.makeuseof.com/fun-linux-command-line-programs/)
- [Run Windows Software On Linux With Bottles - OSTechNix](https://ostechnix.com/run-windows-software-on-linux-with-bottles/)
- [Correct Errors In Previous Console Commands In Linux](https://ostechnix.com/correct-errors-in-linux-commands/ )

---

# Node JS 
### nodejs repository :
https://github.com/nodesource/distributions/blob/master/README.md#debinstall

### installing nodejs :
https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

---

# yt-dlp
Download a video from youtube, [how to install it](https://github.com/yt-dlp/yt-dlp#installation)

##### Download the best :
```bash
yt-dlp -f best <link_here>
```
##### Config that I use : 
Download the highest 1080p .mp4 video-only and merge it with the best audio-only format. If no 1080p, use the highest before that
```bash
yt-dlp -S "res:1080,ext" -f "bv*+ba/b" <link_here> -o "%(title)s.%(ext)s"
```
##### Config explains :
```text
-f mp4 => for video format 
-f best => for the best option
-f 140 => choose the number from the list 
-F => display all available format
-o => C:\Users\dood\Downloads\%(title)s.%(ext)s => for the download path
--no-mtime => the time when you download it not the uploader time
```
##### More config examples :
See the full list  [here](https://github.com/yt-dlp/yt-dlp#format-selection-examples)
```bash
# Download and merge the best video-only format and the best audio-only format,
# or download the best combined format if video-only format is not available
$ yt-dlp -f "bv+ba/b"

# Download best format that contains video,
# and if it doesn't already have an audio stream, merge it with best audio-only format
$ yt-dlp -f "bv*+ba/b"

-----------------------------------------------------------------------------

# Download the best video-only format and the best audio-only format without merging them
# For this case, an output template should be used since
# by default, bestvideo and bestaudio will have the same file name.
$ yt-dlp -f "bv,ba" -o "%(title)s.f%(format_id)s.%(ext)s"

# Download the best video available but with the smallest resolution
$ yt-dlp -S "+res"

# Download the smallest video available
$ yt-dlp -S "+size,+br"

# Download the best mp4 video available, or the best video if no mp4 available
$ yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b"

# Download the best video with the best extension
# (For video, mp4 > webm > flv. For audio, m4a > aac > mp3 ...)
$ yt-dlp -S "ext"

# Download the best video available with the largest resolution but no better than 480p,
# or the best video with the smallest resolution if there is no video under 480p
# Resolution is determined by using the smallest dimension.
# So this works correctly for vertical videos as well
$ yt-dlp -S "res:480"

# Download best video (that also has audio) that is closest in size to 50 MB
$ yt-dlp -f "b" -S "filesize~50M"

# Download the best video with worst codec no worse than h264,
# or the best video with best codec if there is no such video
$ yt-dlp -S "+codec:h264"
```
---

# Speakers and Headphones 
If you are having a problem with switching between speakers and headphones 
```bash
sudo gedit /usr/share/pulseaudio/alsa-mixer/paths/analog-output-speaker.conf
```

**Change or Paste :**
```
[Element Headphone]
switch = off
volume = merge 
overide-map.1 = all
override-map.2 = all-left, all-right

[Element Speaker]
required-any = any
switch = mute
volume = off
```

---

# Open Anything On Default Apps
**On this example, open a video file**
```bash
# open any apps on defaults apps
xdg-open <file-name.mp4>

# or you can do this to if vlc installed
vlc <filename.mp4>
```
---

# Games To Try On Terminal
- bsdgames 
- snake 
- hangman 
- random
- cmatrix 
- cowsay 
- sl 
- figlet 
- aafire 
- espeak
---

# Restarting gnome-shell
- `Alt + F2`
- `r`
---

# Check Installed Gnome Extensions
```bash
# check all installed extensions
gnome-extensions list

# check enabled extensions
gnome-extensions list --enabled
```
---

# Installing Multiple Apps on 1 Command
### By Creating A Script File
- Create a `.sh` file :
```bash
#! /bin/bash
sudo apt install vlc
sudo apt install obs-studio
sudo apt install simplenote
sudo apt install steam
sudo apt install -y wine
sudo apt update && sudo apt upgrade
```

- Make the file executable:
`chmod +x fileName.sh`

- Run the file:
`./fileName.sh`

### By Terminal Command
Install the app using `sudo apt install` just put a space between each app
```bash
sudo apt install vlc obs-studio simplenote steam wine
```
---

# Show Thumbnails In File Manager (Nautilus)
#### For Video Files
https://askubuntu.com/questions/1034595/thumbnails-not-showing-in-video-in-ubuntu-18-04
```bash
sudo apt install ffmpegthumbnailer

# remove thumbnails folder in the .cache folder
rm -r ~/.cache/thumbnails/fail

# if that doesn't work, clear the entire thumbnails folder
rm -rf ~/.cache/thumbnails/*

# quit file manager and then you can re-open it 
nautilus -q 
```
#### For Webp Files
https://fostips.com/enable-thumbnails-webp-ubuntu-fedora/
```bash
# add repository
sudo add-apt-repository ppa:krifa75/eog-ordissimo

# update repository
sudo apt update

# install the package
sudo apt install webp-pixbuf-loader

# remove the repository because it might break other packages
sudo add-apt-repository --remove ppa:krifa75/eog-ordissimo

# quit file manager
nautilus -q 
```

---

# Change App Icon on Ubuntu
```bash
cd /usr/share/applications
sudo gedit <app.name>.desktop
```
**Replace** --> `Icon=/home/<your-user>/Pictures/Icons/something.png`

---

# Fonts
- office fonts for libreoffice : `sudo apt-get install ttf-mscorefonts-installer`
- source-code-pro : https://github.com/adobe-fonts/source-code-pro
---

# Linux File Permission Explanation
https://linuxhandbook.com/linux-file-permissions/

---

# Droidcam Installation
**Change the webcam resolution :**
- navigate to droidcam config file
- `cd /etc/modprobe.d/`
- `sudo nano droidcam.conf`
- change the width and height and then save it

**If there is a kernel update, you have to install the whole thing again :**
```bash
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
# sha1sum: d1038e6d62cac6f60b0dd8caa8d5849c79065a7b
unzip droidcam_latest.zip -d droidcam
cd droidcam
sudo ./install-client
sudo ./install-video
```

**If you have any problem,**
```bash
# unload the driver
sudo rmmod v4l2loopback_dc

# reload the driver with a new resolution
sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=1920 height=1080
```
---

# List Hardware Info
`lshw -short`

### GUI version (install it first)
`lshw-gui` or `lshw-gtk`

---

# Beginner Arch
### ArchTitus
[Arch Titus](https://github.com/ChrisTitusTech/ArchTitus) --> Arch Linux with a script

**Installing ArchTitus:**
```bash
pacman -Sy git
git clone https://github.com/ChrisTitusTech/ArchTitus
cd ArchTitus
./archtitus.sh
```

### Regular Arch Linux Installation
https://github.com/rickellis/Arch-Linux-Install-Guide

---

# Guide For Gaming on Linux
- Ultimate Guide --> https://www.christitus.com/ultimate-linux-gaming-guide/
- Download Other Game Launcher (epic, gog, uplay) --> https://lutris.net/
### GameMode
`gamemoderun ./game`
or
`gamemoded ./game`

---

# QEMU 
### Using QEMU on Terminal
```bash 
# navigate to the .iso file
cd /path/to/iso/file

# create disk image 10GB
qemu-img create -f qcow2 Image.img 10G

# Works with Windows :
qemu-system-x86_64.exe -cdrom .\manjaro-kde-20.0.3-200606-linux56.iso -boot menu=on -drive file=Image.img -m 2G -smp 2 --accel whpx

# Works with Linux :
qemu-system-x86_64 -enable-kvm -show-cursor ./archlinux-2022.04.05-x86_64.iso -boot menu=on -drive file=Image.img -m 2G -smp $(nproc) -cpu host -vga virtio -display gtk,gl=on
```
==> **Basic performance options {LINUX ONLY}**
- `-cpu host` (sets the CPU to the hosts' CPU)
- `-smp 2` (sets the numbers of cores)
- `-smp $(nproc)` (use all available cores)

==> **Basic Graphics Acceleration**
- The `-vga` option can be used to specify one of various vga card emulators: (Linux only)

- "qxl" offers 2D acceleration but requires kernel modules "qxl" and "bochs_drm" to be enabled: 
	`-vga qxl`

- "virtio" works much better and supports some 3D emulation:
	`-vga virtio -display sdl,gl=on`

> **Source:**
https://youtu.be/AAfFewePE7c

> **More Options & Explanations:**
https://wiki.gentoo.org/wiki/QEMU/Options

### Using QEMU with GUI
Guide Virtualization on Linux (virt-manager and qemu)
[virt manager](https://www.christitus.com/vm-setup-in-linux)

---

# Clear Swap Memory
```bash
# Check free memory space
free -m

# Disable swap 
swapoff -a

### Wait approx 30 sec 

# Enable swap
swapon -a

# See the amount of swap used/available decrease over time
free -m
```
---

# Restart Audio Driver
```bash
# reload alsa driver
sudo alsa force-reload

# Start it again with pulseaudio
pulseaudio --start
```
---

# Remove a Directory on Terminal
> remove a directory with nested folders and files
`rm -r` or `rm -rf`

**example :**
`sudo rm -r -v <folders>`

---

# Editing Thunar Visuals
```
thunar -q
GTK_DEBUG=interactive thunar
```
---

# Using wget
##### Download a file or webpage using wget
```bash
wget <URL>
wget -i <download_files.txt>
wget -O <filename> <URL>
```

##### Download a folder using wget
```bash
wget -r <link>
```

##### Download an entire website using wget
```bash
wget -m --convert-links --page-requisites website_address
```

##### Customize download location (recommended)
```bash
wget <link> -O ~/Downloads/<custom-file-name>.deb
```

##### Download with a redirect link
```bash
wget -O <custom-file-name>.deb '<link>'
```

##### Resume incomplete downloads
```bash
wget -c
```

---
# Disable Alt Key Menubar On Firefox
Go to **about:config**
> `ui.key.menuAccessKeyFocuses` change it to  `false`

This will disable menubar when you press the alt key
But still showing when you press the `alt + t` or `alt + h`

> `ui.key.menuAccessKey` change it to `0`

This will completely disable the menubar shortcut
The regular shortcut still work, like `ctrl + w`, `ctrl + t` 

---

# Wifi Drivers
>This works on Realtek Semiconductor Corp. 802.11n

**How to check :**
`lsusb`

**How To Install :**
```bash
sudo apt-get install build-essential git dkms linux-headers-$(uname -r)
git clone https://github.com/kelebek333/rtl8188fu
sudo dkms add ./rtl8188fu
sudo dkms build rtl8188fu/1.0
sudo dkms install rtl8188fu/1.0
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
```

**Configuration :**
```bash
sudo mkdir -p /etc/modprobe.d/
sudo touch /etc/modprobe.d/rtl8188fu.conf
echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
```

**Source :** https://github.com/kelebek333/rtl8188fu

---

# Aliases
```bash
# Show Aliases
alias
````

### Creating temporary aliases
```bash
# Syntax
alias name="yourcustomcommand"

# Example
alias instalation="cd ~/Documents/shell && ./install.sh"
```

### Creating permanent aliases
- bash --> *~/.bashrc*
- zsh --> *~/.zshrc*
- fish --> *~/.config/fish/config.fish*
```bash
# If you are using bash
nano ~/.bashrc

# Put aliases in that file
alias instalation="cd ~/Documents/shell && ./install.sh"

# Use it as current session
source ~/.bashrc
```

### Remove Aliases
```bash
# Remove added aliases
unalias instalation

# Remove all aliases
unalias -a
```
---

# Solve Discord Laggy Performance
***This works by turning on gpu acceleration, by running this on terminal :***
```bash
discord --enable-gpu-rasterization
```

***You must create or edit the `discord.desktop` file, so you don't have to launch discord through terminal, like this :***

- Edit or create the `discord.desktop` usually located here
```bash
nano /home/<your-user>/.local/share/applications/discord.desktop
```

- Paste This :
```bash
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=/usr/bin/discord --enable-gpu-rasterization
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
Path=/usr/bin
```

- `CTRL + X` --> to save and exit
- `Y` --> to confirm
---

# Git Basic Command
```bash
# global config
git config --global user.name "get343"

# config email
git config --global user.email "blablabla@gmail.com"

# initialization
git init

# add all files in the directory
git add .

# commit
git commit -m "first commit"

# change branch to main
git branch -M main

# add a remote repository
git remote add origin "https://get543.github.io/mywebsite.github.io/"

# push changes to github
git push -u origin main


# there's a change in the code and want to upload to github
git add .
git commit -m "commit message"
git push
```

### Github Cheat Sheet
https://dev.to/doabledanny/git-cheat-sheet-50-commands-free-pdf-and-poster-4gcn

---
# Installing Node JS (Node Version Manager)
```bash
# check what the script contains
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh

# if all good you can download and run it
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# will refresh the bashrc
source ~/.bashrc

# list available node version
nvm list-remote

# install node js using version number
nvm install v16.15.1

# install node js using version name
nvm install lts/gallium

# check what version of node installed
node -v
```

**Source :**
- https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
- [The Github Projects](https://github.com/nvm-sh/nvm)

---
# Customize Terminal Command Prompt
On most system usually will look something like this
```bash
user@host:~$ 
```

I'm going to change it to more like this 
```bash
user@host ~
$ 
```

##### Step To Do
Edit the `.bashrc` file
```bash
nano ~/.bashrc
```

Find something like this. Now this is the special characters before adding the color into the prompt
```bash
PS1="\u@\h:\W\$ "
```

And this is after adding a color into the prompt. The coloring added before and after the special characters.
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

Just need to add a newline `\n` before the `$` and delete `:` add a space after that, like this :
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\$ '
```

**Source :** https://www.computerhope.com/issues/ch001645.htm

---
# Fixing OBS Error when Installing
Usually I do this when installing OBS 
```bash
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio
```

But it outputs this error message
```bash
The following packages have unmet dependencies:
 obs-studio : Depends: libfdk-aac1 (>= 0.1.4) but it is not installable
E: Unable to correct problems, you have held broken packages.
```

You need to download the package from the debian website
https://packages.debian.org/stretch/amd64/libfdk-aac1/download

And install it using this command
```bash
# navigate to the downloads folder
cd Downloads

# install it using dpkg command
sudo dpkg -i libfdk-aac1_0.1.4-2+b1_amd64.deb
```

And finally rerun the obs install command
```bash
sudo apt install obs-studio
```

**Note :** I experience broken theme if I use this method. Use flatpak instead

---
# Fixing Printer & Scanner Error
Uninstall `ippusbxd`
```bash
sudo apt purge ippusbxd
```

Download Both `ipp-usb` and `sane-airscan`
https://download.opensuse.org/repositories/home:/pzz/xUbuntu_20.04/amd64/

Just Install it like usual
```bash
sudo dpkg -i ipp-usb_0.9.22-1+52.1_amd64.deb
sudo dpkg -i sane-airscan_0.99.27-1+89.1_amd64.deb
```