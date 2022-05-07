# Unpack `.deb` File
```bash 
sudo dpkg -i thefilename.deb
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
**If tar gives a Cannot exec error, you may need to sudo apt install xz-utils first.**

### Installing from a `.tar` file
```bash
# if the file is .tar.gz
tar xvzf PACKAGENAME.tar.gz

#if the file is .tar.bz2
tar xvjf PACKAGENAME.tar.bz2

./configure
make
sudo make install
```
---

# Clone Repositories
`git clone <repository URL>`

---

# Some Tips Tutorials
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

# yt-dlp Best Option
`yt-dlp -f best <link_here>`

**for the config :**
```text
-f mp4 => for format 
-f best => for best option
-f 140 => choose the number from the list 
-F => display all available format
-o => C:\Users\fghaz\Downloads\%(title)s.%(ext)s => for the download path
--no-mtime => the time when you download it not the uploader time
```
---

# Benerin Ouput Device
```bash
sudo gedit /usr/share/pulseaudio/alsa-mixer/paths/analog-output-speaker.conf
```

**Change :**
[Element Headphone]
switch = off
volume = merge 
overide-map.1 = all
override-map.2 = all-left, all-right

[Element Speaker]
required-any = any
switch = mute
volume = off

---

# Open Anything On Default Apps
**On this example, open a video file**
```bash
# open any apps on defaults apps
xdg-open <file-name.mp4>

# or you can do this to 
vlc <filename.mp4>
```
---

# Games On Terminal
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
gnome-extensions list
gnome-extensions list --enabled
```
---

# Installing Multiple Apps on 1 Command
- create a `.sh` file :
```bash
#! /bin/bash
sudo apt-get install vlc
sudo apt-get install obs-studio
sudo apt-get install simplenote
sudo apt-get install steam
sudo apt-get install -y wine
sudo apt-get update && sudo apt-get upgrade
```

- make the file executable:
`chmod +x yourFile.sh`

- run the file:
`./yourFile.sh`
---

# Show Thumbnails for Video
https://askubuntu.com/questions/1034595/thumbnails-not-showing-in-video-in-ubuntu-18-04

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
**Change the webcam resolution : **
- navigate to droidcam config file
- `cd /etc/modprobe.d/`
- `sudo nano droidcam.conf`
- change the width and height and then save it

**If there is a kernel update, you have to install the whole thing again : **
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

# Guide For Beginner Arch User
### ArchTitus
[Arch Titus](https://github.com/ChrisTitusTech/ArchTitus) --> Arch Linux with a script

**Installing ArchTitus: **
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
cd d:/

# create disk image
qemu-img create -f qcow2 Image.img 10G

# Works with Windows :
qemu-system-x86_64.exe -cdrom .\manjaro-kde-20.0.3-200606-linux56.iso -boot menu=on -drive file=Image.img -m 2G -smp 2 --accel whpx

# Works with Linux :
qemu-system-x86_64 -enable-kvm -show-cursor ./archlinux-2022.04.05-x86_64.iso -boot menu=on -drive file=Image.img -m 2G -smp $(nproc) -cpu host -vga virtio -display gtk,gl=on
```
==> **Basic performance options {LINUX ONLY}**
 `-cpu host` (sets the CPU to the hosts' CPU)
 `-smp 2` (sets the numbers of cores)
 `-smp $(nproc)` (use all available cores)

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
### Download a file or webpage using wget
```bash
wget <URL>
wget -i <download_files.txt>
wget -O <filename> <URL>
```

### Download a folder using wget
`wget -r <link>`

### Download an entire website using wget
`wget -m --convert-links --page-requisites website_address`

### Customize download location (recommended)
`wget <link> -O ~/Downloads/<custom file name>.deb`

### Resume incomplete downloads
`wget -c`

---
