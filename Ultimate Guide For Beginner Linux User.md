> [!NOTE]
> You can use this as a guide if you are using **ubuntu or ubuntu based** distros.
> I think some of this will work to on **debian** distros.

> [!CAUTION]
> If you see something like this `<name>` in the command, remove the brackets `<>` and replace it with what the bracket says.
> Read before copy and pasting!

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


# Unpack `.deb` File
```bash 
# this will work mostly fine
sudo dpkg -i thefilename.deb

# using apt
sudo apt install ./thefilename.deb

# run this if you get any dependency errors
sudo apt install -f
```


# Upgrade Major Versions
## Fedora
In this example, I'm going to show you how to upgrade from fedora 36 to fedora 37.
- Make sure the packages in your system is already up-to-date.
```bash
# upgrade system and reboot pc
sudo dnf upgrade
reboot
```

- Check again if it is fully upgraded.
```bash
sudo dnf upgrade --refresh
```

- Install the `dnf-plugin-system-upgrade` if you haven't done that already.
```bash
sudo dnf install dnf-plugin-system-upgrade
```

- Download the upgrade. Keep in mind that it is only support for 2 major releases. If you want to upgrade more please visit the [official documentation.](https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/#sect-how-many-releases-can-i-upgrade-across-at-once)
```bash
sudo dnf system-upgrade download --releasever=37
```
Change the `--releasever=` number if you want to upgrade to a different version.

- If you are having an issue with dependencies, you can try this command. **Only if you're having problems.**
```bash
sudo dnf system-upgrade download --releasever=37 --allowerasing --best
```

- When you are done with the process, trigger the `uprade-system`. This will reboot the system immediately without countdown and confirmation, so close all the programs and save your work.
```bash
sudo dnf system-upgrade reboot
```
Reboot process going to take longer because it needs to apply the update just before the OS (on the boot logo).
Don't touch anything assume that everything is fine even if the progress bar is not moving.

- Remove cache and unused packages from previous versions and upgrades.
```bash
# remove cached metadata and transaction
sudo dnf system-upgrade clean

# remove cached packages
sudo dnf clean packages
```

> Please Visit this official documentation from fedora. Because there's  a lot of things that I didn't cover here.
> **Source :** https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/


# Extract `.tar.xz` File
https://linuxize.com/post/how-to-extract-unzip-tar-xz-file/
```bash
tar xfv <file-name>.tar.xz
tar xfv <file-name>.tar.bz2
tar xfv <file-name>.tar.gz
tar xfv <file-name>.tar
```

Extract file into a directory
```bash
tar xfv <archive-name>.tar --directory=path/to/directory
tar xfv <archive-name>.tar.gz --directory=path/to/directory
tar xfv <archive-name>.tar.bz2 --directory=path/to/directory
tar xfv <archive-name>.tar.xz --directory=path/to/directory
````
**If tar gives a `Cannot exec` error, you may need to run `sudo apt install xz-utils` first.**

### Installing from a `.tar` file
```bash
# if the file is .tar.gz
tar xfvz <archive-name>.tar.gz

# if the file is .tar.bz2
tar xfvj <archive-name>.tar.bz2

./configure
make
sudo make install
```
**see this for more info :** https://help.ubuntu.com/community/CompilingEasyHowTo


# How To Clone Git Repositories
`git clone <repository URL>`

Example : 
`git clone https://github.com/get543/linux-beginner-guide`


# Other Tips Tutorials
- [How to Dual Boot POP OS 20.04 LTS and Windows 10 - 2021](https://youtu.be/hbzCSjlbInY)
- [15 Best GNOME Extensions for Ubuntu (2021 Edition) - OMG! Ubuntu!](https://www.omgubuntu.co.uk/best-gnome-shell-extensions)
- [8 Irresistible Icon Sets for Ubuntu (2020 Edition)](https://www.omgubuntu.co.uk/best-icon-themes-ubuntu)
- [The 8 Best Linux Download Managers for Faster Downloads](https://www.makeuseof.com/best-download-managers-for-linux/)
- [Download Microsoft To Do](https://github.com/klaussinani/ao) [From Snap](https://snapcraft.io/install/microsoft-todo-unofficial/ubuntu)
- [10 Fun Linux Command-Line Programs You Should Try When Bored](https://www.makeuseof.com/fun-linux-command-line-programs/)
- [Run Windows Software On Linux With Bottles - OSTechNix](https://ostechnix.com/run-windows-software-on-linux-with-bottles/)
- [Correct Errors In Previous Console Commands In Linux](https://ostechnix.com/correct-errors-in-linux-commands/ )


# Node JS 
### nodejs repository :
https://github.com/nodesource/distributions/blob/master/README.md#debinstall

### installing nodejs :
https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04


# yt-dlp
Download a video from youtube, [how to install it.](https://github.com/yt-dlp/yt-dlp#installation)

##### Download the best :
```bash
yt-dlp -f best <link-here>
```
##### Config that I use :
Download the highest 1080p .mp4 video-only and merge it with the best audio-only format. If no 1080p, use the highest before that.
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
See the full list  [here.](https://github.com/yt-dlp/yt-dlp#format-selection-examples)
```bash
# Download and merge the best video-only format and the best audio-only format,
# or download the best combined format if video-only format is not available
$ yt-dlp -f "bv+ba/b"

# Download best format that contains video,
# and if it doesn't already have an audio stream, merge it with best audio-only format
$ yt-dlp -f "bv*+ba/b"


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


# Switch Between Speakers and Headphones Without Unpluging
## Adding Config
If you are having a problem with switching between speakers and headphones.
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

## Use Indicator-Sound-Switcher or Pavucontrol
```bash
sudo apt-get install indicator-sound-switcher
sudo apt install pavucontrol
```

## Enable Auto Mute on Alsamixer
- Type this on terminal :
```bash
alsamixer
```

- `F6` to select sound card.

- Find sound card that you can enable or disable automute.

- Use `right/left` arrow key and use `up/down` arrow key to change the value.

## Script Toggle Auto Mute on Alsamixer
- Download autokey (control the OS with Python script).
```bash
sudo apt install autokey-gtk
```

- Add a new script.

- Name: `Toggle Auto Mute`.

- Add this script :
```Python
# Toggle - Disable or Enable Auto-Mute Mode

import os

# user input
# To get sound card number, open Terminal → Type → alsamixer → press Enter → press F6
sound_card_number = 2
# end of user input
###############################################################
time.sleep(0.5)
get_info_command = "amixer -c %s get 'Auto-Mute Mode'" % sound_card_number
get_info = system.exec_command(get_info_command)
time.sleep(1)    
if get_info.find("Item0: 'Disabled'") is not -1: # disabled
  time.sleep(0.8)
  enable = "amixer -c %s set 'Auto-Mute Mode' Enabled" % sound_card_number
  system.exec_command(enable)
  os.system("notify-send 'Auto-Mute Mode of Sound Card Number %s' 'Enabled'" % sound_card_number)
  quit()
else:   # enabled   
  time.sleep(0.8) 
  disable = "amixer -c %s set 'Auto-Mute Mode' Disabled" % sound_card_number
  system.exec_command(disable)
  os.system("notify-send 'Auto-Mute Mode of Sound Card Number %s' 'Disabled'" % sound_card_number)
```

- Change `sound_card_number` that has auto mute that you can disable or enable.

- To do that, type this on terminal :
```bash
alsamixer
```

- Press `F6` to select sound card. And the number next to the sound card name is the `sound_card_number`.

## Using Shell Script
You can use [this](https://raw.githubusercontent.com/get543/linux-beginner-guide/main/changing-output-device/change.sh) shell script to change output device between headphones and speakers. It uses zenity, it comes pre-installed on Ubuntu based distros. This is the same script as the Python script the only differrence is you don't have to download autokey.


# Open Anything On Default Apps
**On this example, open a video file :**
```bash
# open any apps on defaults apps
xdg-open <file-name.mp4>

# or you can do this to if vlc installed
vlc <filename.mp4>
```


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


# Restarting gnome-shell
- `Alt + F2`
- `r`


# Check Installed Gnome Extensions
```bash
# check all installed extensions
gnome-extensions list

# check enabled extensions
gnome-extensions list --enabled
```


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

- Make the file executable :
`chmod +x fileName.sh`

- Run the file :
`./fileName.sh`

### By Terminal Command
Install the app using `sudo apt install` just put a space between each app
```bash
sudo apt install vlc obs-studio simplenote steam wine
```


# Show Thumbnails In File Manager 
## Nautilus
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

## Thunar File Manger
https://superuser.com/questions/258633/why-is-thunar-not-creating-and-showing-thumbnails-of-images
To get thumbnail on your thunar file manager, you need to install tumbler package.
```bash
# example on arch based systems
sudo pacman -Sy tumbler

# example on debian based systems
sudo apt install tumbler
```

Restart the file manager
```bash
# quit the application
thunar -q

# run it again
thunar
```


# Change App Icon on Ubuntu
```bash
cd /usr/share/applications
sudo gedit <app-name>.desktop
```
**Replace** → `Icon=/home/<current-user>/Pictures/Icons/something.png`


# Fonts
- office fonts for libreoffice : `sudo apt-get install ttf-mscorefonts-installer`
- source-code-pro : https://github.com/adobe-fonts/source-code-pro


# Linux File Permission Explanation
https://linuxhandbook.com/linux-file-permissions/


# Droidcam Installation
**Change the webcam resolution :**
- navigate to droidcam config file.
- `cd /etc/modprobe.d/`
- `sudo nano droidcam.conf`
- change the width and height and then save it.

**If there is a kernel update, you have to reinstall droidcam :**
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
 

# List Hardware Info
`lshw -short`

### GUI version (install it first)
`lshw-gui` or `lshw-gtk`


# Beginner Arch
### ArchTitus
[Arch Titus](https://github.com/ChrisTitusTech/ArchTitus) → Arch Linux with a script.

**Installing ArchTitus:**
```bash
pacman -Sy git
git clone https://github.com/ChrisTitusTech/ArchTitus
cd ArchTitus
./archtitus.sh
```

### Regular Arch Linux Installation
https://github.com/rickellis/Arch-Linux-Install-Guide


# Guide For Gaming on Linux
- Ultimate Guide → https://www.christitus.com/ultimate-linux-gaming-guide/
- Download Other Game Launcher (epic, gog, uplay) → https://lutris.net/
### Run GameMode
```bash
# this
gamemoderun ./game

# or this
gamemoded ./game
```


# QEMU 
## Using QEMU on Terminal
```bash 
# navigate to the .iso file
cd /path/to/iso/file

# create disk image 10GB
qemu-img create -f qcow2 Image.img 10G
```
```powershell
# for windows :
qemu-system-x86_64.exe -cdrom .\manjaro-kde-20.0.3-200606-linux56.iso -boot menu=on -drive file=Image.img -m 2G -smp 2 --accel whpx
```
```bash
# for linux :
qemu-system-x86_64 -enable-kvm -show-cursor -cdrom ./archlinux-2022.04.05-x86_64.iso -boot menu=on -drive file=Image.img -m 2G -smp $(nproc) -cpu host -vga virtio -display gtk,gl=on
```
### Basic performance options (Linux only)
- `-cpu host` → sets the CPU to the hosts' CPU.
- `-smp 2` → sets the numbers of cores.
- `-smp $(nproc)` → use all available CPU cores.

### Basic Graphics Acceleration
- The **-vga** option can be used to specify one of various vga card emulators :
  `-vga` → **Linux only**

- **qxl** offers 2D acceleration but requires kernel modules **qxl** and **bochs_drm** to be enabled :
	`-vga qxl`

- **virtio** works much better and supports some 3D emulation :
	`-vga virtio -display sdl,gl=on`

> **Source :**
https://youtu.be/AAfFewePE7c

> **More Options & Explanations :**
https://wiki.gentoo.org/wiki/QEMU/Options

## Using QEMU with GUI
Guide Virtualization on Linux (virt-manager and qemu).
[virt manager](https://www.christitus.com/vm-setup-in-linux)


# Clear Swap Memory
I made my own script it is a file called `freeramcache.sh`. But if you want essentially the same thing as the command below.

```bash
# check free memory space
free -h

# disable swap 
swapoff -a

##### wait approx 30 sec 

# enable swap
swapon -a

# see the amount of swap used/available, decrease over time
free -h
```


# Expand or Create A New Swap Memory
- See the current status of your swap memory.
```bash
# swap usage info
free -h

# swap status
swapon -s
```

- Disable the swap memory.
```bash
# disable swap memory
sudo swapoff -a
```

- Create or overwrite the old one with `/swapfile`
  - `1G` is the units
  - `8` is the integer
    So together they define the size.
  - size = 8GB
It may take a while to create the file, for me it was a couple of minutes.
```bash
# create a /swapfile that is 8GB in size
sudo dd if=/dev/zero of=/swapfile bs=1G count=8

# set the correct permissions
sudo chmod 0600 /swapfile

# set up a linux swap area
sudo mkswap /swapfile
```

## To make it permanent upon restart
```bash
# # edit the file
# sudo nano /etc/fstab

# add that line in /etc/fstab
echo "/swapfile   none  swap  sw  0   0" > /etc/fstab

# enable swap memory
sudo swapon /swapfile
```


# Restart Audio Driver
```bash
# reload alsa driver
sudo alsa force-reload

# if it doesn't work, try using this
systemctl --user restart pulseaudio

# start it again with pulseaudio
pulseaudio --start
```


# Remove a Directory on Terminal
> Remove a directory with nested folders and files.
`rm -r` or `rm -rf` or `rm -rfv`

**Example :**
```bash
sudo rm -rfv <folders>
```


# Editing Thunar Visuals
```bash
thunar -q
GTK_DEBUG=interactive thunar
```


# Using Wget
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
This is done by creating a mirror of the website.
```bash
wget -m --convert-links --page-requisites website_address
```

##### Customise download location
```bash
wget <link> -O ~/Downloads/<custom-file-name>.deb
```

##### Download with a redirect link and custom download location (recommended)
```bash
wget -O <custom-file-name>.deb "<link>"
```

##### Resume incomplete downloads
```bash
wget -c
```


# Using cURL
##### Download a web page and put it in a file
```bash
curl "<http://example.com>" --output "<filepath>"
```

##### Download a file from a URL and keep file name from what its given
```bash
curl --remote-name "<http://example.com/filename>"
```

##### Download with a redirect link, auto resume if there's an error, shows the error, and custom file path (recommended)
```bash
curl --output "<filepath-or-filename>" --fail --show-error --location --continue-at - "<http://example.com/filename>"
```


# Disable Alt Key Menubar On Firefox
Go to **about:config**
> `ui.key.menuAccessKeyFocuses` change it to  `false`

This will disable menubar when you press the alt key.
But still showing when you press the `alt + t` or `alt + h`.

> `ui.key.menuAccessKey` change it to `0`

This will completely disable the menubar shortcut.
The regular shortcut still work, like `ctrl + w`, `ctrl + t`.


# Wifi Drivers
>This works on Realtek Semiconductor Corp. 802.11n.

**How to check :**
```bash
lsusb
```

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


# Aliases
```bash
# show Aliases
alias
````

### Creating temporary aliases
```bash
# syntax
alias name="yourcustomcommand"

# example
alias instalation="cd ~/Documents/shell && ./install.sh"
```

### Creating permanent aliases
- bash → `~/.bashrc`
- zsh → `~/.zshrc`
- fish → `~/.config/fish/config.fish`
```bash
# if you are using bash
nano ~/.bashrc

# put this aliases in that file
alias instalation="cd ~/Documents/shell && ./install.sh"

# use it as current session
source ~/.bashrc
```

### Remove Aliases
```bash
# remove added aliases
unalias instalation

# remove all aliases
unalias -a
```


# Solve Discord Laggy Performance
***This works by turning on gpu acceleration, by running this on terminal :***
```bash
discord --enable-gpu-rasterization
```

***You must create or edit the `discord.desktop` file, so you don't have to launch discord through terminal, like this :***

- Edit or create the `discord.desktop` usually located here :
```bash
sudo nano /home/$USER/.local/share/applications/discord.desktop
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

- `CTRL + X` → to save and exit.
- `Y` → to confirm.
 

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
git remote add origin "https://get543.github.io/mywebsite"

# push changes to github
git push -u origin main


# there's a change in the code and want to upload to github
git add .
git commit -m "commit message"
git push


# connecting github repository using ssh
git remote set-url origin git@github.com:get543/<project-name>.git
```

### Github Cheat Sheet
https://dev.to/doabledanny/git-cheat-sheet-50-commands-free-pdf-and-poster-4gcn

 
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

 
# Customise Terminal Prompt
On most system usually will look something like this :
```bash
user@host:~$ 
```

I'm going to change it to more like this :
```bash
user@host ~
$ 
```

##### Step To Do
Edit the `.bashrc` file.
```bash
nano ~/.bashrc
```

Find something like this. Now this is the special characters before adding the colour into the prompt.
```bash
PS1="\u@\h:\W\$ "
```

And this is after adding a colour into the prompt. The colouring added before and after the special characters.
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

Just need to add a newline `\n` before the `$` and delete `:` add a space after that, like this :
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\$ '
```

**Source :** https://www.computerhope.com/issues/ch001645.htm

 
# Fixing OBS Error when Installing
Usually I do this when installing OBS.
```bash
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio
```

But it outputs this error message.
```bash
The following packages have unmet dependencies:
 obs-studio : Depends: libfdk-aac1 (>= 0.1.4) but it is not installable
E: Unable to correct problems, you have held broken packages.
```

You need to download the package from the debian website
https://packages.debian.org/stretch/amd64/libfdk-aac1/download

And install it using this command :
```bash
# navigate to the downloads folder
cd Downloads

# install it using dpkg command
sudo dpkg -i libfdk-aac1_0.1.4-2+b1_amd64.deb
```

And finally rerun the obs install command.
```bash
sudo apt install obs-studio
```

**Note :** I experience broken theme if I use this method. Use flatpak instead.

 
# Fixing Printer & Scanner Error
Uninstall `ippusbxd`.
```bash
sudo apt purge ippusbxd
```

Download Both `ipp-usb` and `sane-airscan`.
https://download.opensuse.org/repositories/home:/pzz/xUbuntu_20.04/amd64/

Just Install it like usual.
```bash
sudo dpkg -i ipp-usb_0.9.22-1+52.1_amd64.deb
sudo dpkg -i sane-airscan_0.99.27-1+89.1_amd64.deb
```


# Replace 'apt' With 'nala'
Their github page [here](https://gitlab.com/volian/nala) 
Copy paste guide [here](https://christitus.com/stop-using-apt/)

#### Installation
- Install the volian scar repo.
```bash
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
```

- Add the source.
```bash
echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list
```

- For Ubuntu 22.04 and newer.
```bash
sudo apt update
sudo apt install nala
```

- Ubuntu 21.04 and lower.
```bash
sudo apt update
sudo apt install nala-legacy
```

#### Change 'apt' to 'nala'
- Edit the `~/.bashrc` file.
```bash
nano ~/.bashrc
```

- Add this to the end of the file.
```shell
# replacing apt with nala
apt() { 
  command nala "$@"
}

sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}
```

- `CTRL + X` then `Y` to save it.

- Refresh the file.
```bash
source ~/.bashrc
```

 
# Flush DNS Cache on Linux
```bash
sudo systemd-resolve --flush-caches
sudo resolvectl flush-caches
sudo systemd-resolve --statistics
```


# Basic Vim Commands
- `:e <filename>` → open filename to edit
- `:w` → save file
- `:q` → exit vim
- `:q!` → quit without saving
- `:wq` → save file and close vim
- `:x` → write file and exit
- `:sav <filename>` → saves file as filename
- `:!pwd` → execute the PWD Unix command, and returns to vi
- `yy` → copies the current line
- `p` → pastes the copied text
- `u` → undo the previously executed command
- `dd` → deletes the current line
- `: f <filename>` → rename the file


# Keyboard shortcuts for the Linux terminal on Ubuntu
- `TAB` → autocomplete the command
- `TAB TAB` → for displaying all file names and commands that start with those letters
- `ctrl + alt + t` → for opening the terminal
- `ctrl + u` → to remove the current line
- `ctrl + a` → move the cursor to start of the line
- `ctrl + e` → move the cursor to the end of the line
- `ctrl + c` → to stop the current command
- `ctrl + z` → to put a running command to sleep
- `fg` → to continue the process that's put to sleep
- `bg` → to continue the process in the background


# Listen to your own microphone
```bash
# to turn it on
pactl load-module module-loopback latency_msec=1

# to turn it off
pactl unload-module module-loopback
```

It loads a loopback module. The number 1 means the latency you receive. The latency is in miliseconds (ms). To turn it off, you just unload the module.


# Add Git Branch on Bash Prompt
**Before:**
```bash
user@host ~/Downloads/linux-beginner-guide
$
```
**After:**
```bash
user@host ~/Downloads/linux-beginner-guide (main)
$
```

To do that you need to edit the `.bashrc` file in the `home` folder

- Open the file on text editor
```bash
nano ~/.bashrc
```

- Add this function to the file
```bash
# git branch on terminal
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
```

- Add `$(parse_git_bashrc)` to run the function in bash prompt
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\]$(parse_git_branch)\[\033[00m\]\n\$ '
```

- Finally refresh the `.bashrc` file
```bash
source ~/.bashrc
```


# Connecting Git using SSH Key
### 'Permission Denied (publickey)' error 
This means, on your local machine, you haven't made any SSH keys.

### How To Fix :
1. Open terminal.
2. Change to `.ssh` directory.
```bash
# for linux
cd ~/.ssh

# for windows
cd C:\Users\<your-windows-username>\.ssh\
```
3. Do a listing to see what file in that directory.
```bash
# listing
ls

# for long-listing
ll
```
4. There should be these two files: `id_rsa` and `id_rsa.pub`. These are the files that tell your computer how to communicate with GitHub. If those two files don't show up, or if you have something similar just proceed to the next step, we are just going to create a new one. ***Your SSH keys must be named `id_rsa` and `id_rsa.pub` in order for GitHub to recognize them by default.***
5. To create the SSH keys. Change `your_email@example.com` to your github email. This will create both `id_rsa` and `id_rsa.pub` files. 
```bash
ssh-keygen -t rsa -C "your_email@example.com"
```
6. Use the `cat` command to see what's the content inside of a file.
```bash
cat id_rsa.pub
```
7. Copy all of them, and paste it into your [GitHub Account Settings > SSH Keys](https://github.com/settings/keys). 
8. Give it a name, like :  **Github on Linux - RSA Key**
9. Now that you've added your public key to Github, try `git push` and let see if it works.

> Don't forget to connect the repository through ssh
> `git remote set-url origin git@github.com:get543/<project-name>.git`

More help on [creating SSH Keys.](https://help.github.com/articles/generating-ssh-keys)


# Blackscreen on XFCE in Virt-Manager using 3D Acceleration
**This issue can be resolve by replacing default XFCE Compositor to picom.**
1. Boot into the VM using `QXL`.
2. Disable the default display compositor, here is how to do that :
	- search for `Window Manager Tweaks`.
	- go to the `Compositor` tab.
	- uncheck `Enable display compositing`.
3. Install the new display compositor `(picom)`. Install it using your distro's default package manager.
```bash
# for debian based distros
sudo apt install picom

# for arch based distros
sudo pacman -S picom
```
4. Make a `picom` directory in `.config` for start script and config file. And make the start script executable.
```bash
# change directory
cd ~/.config

# make directory
mkdir picom

# from ~/.config change directory
cd picom

# make start.sh file
touch start.sh

# make start.sh an executable file
chmod +x start.sh

# make picom.conf file
touch picom.conf
```
5. Paste this for `start.sh` file
```bash
sleep 2 && picom -b --config /home/$USER/.config/picom/picom.conf
```
  - `sleep` → delay the command for 2 seconds.
  - `-b` → run picom in the background.
  - `--config` → load a custom config path.
6.  - Save [`picom.conf`](https://raw.githubusercontent.com/get543/linux-beginner-guide/main/config/picom.conf) file to `~/.config/picom/picom.conf`.
    - Or this [`picom.conf`](https://raw.githubusercontent.com/jEsuSdA/the-perfect-desktop/master/compton-picom/picom.conf) file for the full version, and save the file as `picom.conf` on `~/.config/picom/picom.conf`.
7. Put the `start.sh` into start script at login. To do that, search for `Session and Startup`.
8. Go to the `Application Autostart` tab and click `Add`.
9. Fill it like this :
	- Name → **Picom**
	- Description → **Starts Picom Compositor**
	- Command → `/home/<username>/.config/picom/start.sh`
	- Trigger → **on login**
10. Click `OK` and `Close`
11. Finally, reboot your VM.


# Terminal Window Title Show Running Command
If you have **[starship](https://starship.rs/)** installed, you can run the [custom function.](https://starship.rs/advanced-config/#change-window-title) 
- Edit `.bashrc` file
```bash
nano ~/.bashrc
```
- Paste this
```bash
# custom starship window title function
function set_win_title() {
  local cmd=" 💨 ($@)"

  if [[ "$cmd" == " 💨 (starship_precmd)" || "$cmd" == " 💨 ()" ]]
  then
    cmd=""
  fi

  if [[ $PWD == $HOME ]]
  then
    if [[ $SSH_TTY ]]
    then
      echo -ne "\033]0; 🏛️ @ $HOSTNAME ~$cmd\a" < /dev/null
    else
      echo -ne "\033]0; 🏠 ~$cmd\a" < /dev/null
    fi
  else
    BASEPWD=$(basename "$PWD")
    if [[ $SSH_TTY ]]
    then
      echo -ne "\033]0; 🌩️ $BASEPWD @ $HOSTNAME $cmd\a" < /dev/null
    else
      echo -ne "\033]0; 📁 $BASEPWD $cmd\a" < /dev/null
    fi
  fi
}

starship_precmd_user_func="set_win_title"
eval "$(starship init bash)"
trap "$(trap -p DEBUG |  awk -F"'" '{print $2}');set_win_title \${BASH_COMMAND}" DEBUG
```


# Dealing With Disk Permissions

## Unmount & remount with different permission
```bash
# list all disks
lsblk

# unmount /dev/sdb1 disk
sudo umount /dev/sdb1

# make usbdrive directory in /media/$USER
mkdir /media/$USER/usbdrive

# mount /dev/sdb1 with read, write, exe permissions to usbdrive folder
sudo mount -t vfat -o rw,exec,uid=1000,gid=1000,umask=022 /dev/sdb1 usbdrive
```

## Mount disk to startup applications
```bash
# mount /dev/sdb3 disk
udisksctl mount -b /dev/sdb3
```

## Change ownership of a folder
```bash
# change owner of usbdrive folder to the current user
sudo chown -R $USER usbdrive
```


# Bash Completion Case Insensitive
Add this to the `~/.bashrc` file
```bash
bind -s 'set completion-ignore-case on'
```


# Thunar Change  Default Terminal
Create a file and edit it
```bash
nano ~/.config/xfce4/helpers.rc
```
Add this to the file. **This is an example of `kitty` terminal**
```config
TerminalEmulator=kitty
TerminalEmulatorDismissed=true
```


# Change from `Bash` to `Zsh`
## Zsh Installation
[This wiki page](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) covers a very detail installation of zsh with a lot of distros as an example.
- Install `zsh` to package.
```bash
# if you are using debian or ubuntu based distros
sudo apt install zsh

# if you are using arch based distros
sudo pacman -Sy zsh

# if you are using fedora based distros
sudo dnf install zsh
```

- Run `zsh` command to make sure that it is installed and create a `.zshrc` file as a starting point.
- Change default shell to `zsh`.
```bash
chsh -c $(which zsh)
```

## Installing Oh-My-Zsh
- Make sure that git and wget and curl is installed.
```bash
# for debian
sudo apt install git curl wget

# for arch
sudo pacman -Sy git curl wget

# for fedora
sudo dnf install git curl wget
```
- Installing Oh-My-Zsh using the official script from oh-my-zsh github.
```bash
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
- Oh-My-Zsh will create a new file of `.zshrc` and for the old one is still there just under different name.
- Change theme and other cool stuff in `.zshrc`. If you don't know what to do, you can go to the official [Oh-My-Zsh wiki page](https://github.com/ohmyzsh/ohmyzsh/wiki).
```bash
nano ~/.zshrc
```
- And if you are done, you can use it as a current session with this command
```bash
source ~/.zshrc
```

**Just to be safe, logout and logback in to make sure everything is set up as it should be.**

### Oh-My-Zsh Plugins
Some of my favourites :
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) → Add git aliases.
- [sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) → If you forgot to run the command as `sudo`, press `esc` twice.
- [archlinux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux) [dnf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf) [ubuntu](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ubuntu) → Add aliases to your distro's package manager.
- [web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search) → Search something in the terminal.
- [dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory) → Navigating directory using keyboard shortcut, like in file manager.
- [copybuffer](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer) → Copy current text in the command line to system clipboard with `CTRL + O`
- [coppypath](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath) → Copy path to system clipboard by running `copypath` command.
- [autojump](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump) → Jump to directory based on your history [**install autojump first.**](https://github.com/wting/autojump#installation)
- [zsh-syntax-highliting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) → Add syntax highliting to your shell, like fish shell.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) → Add suggestions as you type the command, like fish shell.

Find out more: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

### Oh-My-Zsh Theme
Some of my fovourite themes :
- [robbyrussell](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell) (default)
- [af-magic](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#af-magic)
- [amuse](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#amuse) 
- [avit](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#avit) (currently)
- [bira](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#bira)
- [cloud](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#cloud)
- [dst](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#dst)
- [fino-time](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#fino-time)
- [gnzh](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#gnzh)
- [half-life](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#half-life)
- [jispwoso](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#jispwoso)
- [josh](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#josh)
- [steeef](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#steeef)

Find out more: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes


# Change Linux Login Screen's Resolution

## XFCE (lightdm)
- Find the name of connected display
```bash
xrandr -d
```

- Result of `xrandr -d`
```bash
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
Virtual-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
...
```
**`Virtual-1` is my display**

- Create a script in /usr/share with `sudo nano /usr/share/lightdmxrandr.sh`
```bash
#!/bin/sh
xrandr --output Virtual-1 --primary --mode 1920x1080
```

- Make the script executable
```bash
chmod u+x /usr/share/lightdmxrandr.sh
```

- Edit lightdm config file with `sudo nano /etc/lightdm/lightdm.conf`

- Uncomment and Add the script. Add it below **`[Seat:*]`**.
```conf
[Seat:*]
display-setup-script=/usr/share/lightdmxrandr.sh
greeter-setup-script=/usr/share/lightdmxrandr.sh
```

- `reboot`

## KDE Plasma (sddm)
- Find the display name with `xrandr -q`, and this is the result
```bash
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
Virtual-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 403mm x 302mm
...
```

- Edit the setup script `sudo nano /usr/share/sddm/scripts/Xsetup`

- Add this line
```bash
# change display resolution
xrandr --output Virtual-1 --mode 1920x1080 --rate 60.00
```

- `reboot`

## Gnome (gdm)
- Set the resolution in `Settings > Display` and click `Apply`. That will create a `monitor.xml` file, a configuration file for your monitor.

- Copy that configuration file in the gdm `.config` folder.
```bash
# this 
sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml

# if it doesn't work, go with this
sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/monitors.xml
```


# Change Grub Theme

## Look location of the current installed theme (if available).
```bash
cat /etc/default/grub | grep GRUB_THEME=
```
**If it shows a value to a path**, that means that you have to install the theme there. Example for me :
```config
GRUB_THEME=/usr/share/grub/themes/zorin/theme.txt
```
So I have to install the theme in `/usr/share/grub/themes` folder.

**If there's a `#` in front of `GRUBTHEME=`**, it means that no themes is being used. So, it is better to install the theme in `/boot/grub/themes` folder. If you don't have it, follow this step :

- Create folder with `mkdir` command. (`-p` to just create every folder before `themes` if it doesn't exist).
```bash
mkdir -p /boot/grub/themes
```

- Change the ownership of `/boot/grub/themes` folder.
```bash
sudo chown $USER /boot/grub/themes
```

## Installing Theme
Your theme that you downloaded should have a file called `theme.txt`. That file you will going to put it in `GRUB_THEME=` in `/etc/default/grub`.

- So the first step you need to do is edit the config file.
```bash
sudo nano /etc/default/grub
```

- Find `GRUB_THEME=` and your new theme refrencing to the `theme.txt`.
```bash
# grub theme before i changed it
GRUB_THEME=/usr/share/grub/themes/zorin/theme.txt

# the new grub theme
GRUB_THEME=/usr/share/grub/themes/legion/dedsec/theme.txt
```

## Change desired resolution for the grub menu (optional)
- Edit the config file.
```bash
sudo nano /etc/default/grub
```

- Find `GRUB_GFXMODE=` and change it to your disired resolution `GRUB_GFXMODE=1920x1080`.

## Run this command everytime you make changes to the config file
```bash
# would mostly work
sudo update-grub

# if that doesn't work, try this
sudo grub-mkconfig -o /boot/grub/grub.cfg

# if it doesn't work either, try this one
sudo grub2-mkconfig -o /boot/grub/grub.cfg
```

> Please see the github repo of your theme to install it properly.


# Change Boot Splash Screen on Linux
## General Installation Instructions:
- Copy **YOURTHEME** folder to `usr/share/plymouth/themes/YOURTHEME`.

- Install **YOURTHEME** in `/usr/share/plymouth/themes`.
```bash
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/YOURTHEME/YOURTHEME.plymouth 100
```

- Switch `default.plymouth` to the new one.
```bash
sudo update-alternatives --config default.plymouth
```
And then choose your new theme.

- Re-generate `initramfs` image.
```bash
sudo update-initramfs -u
```

**More info :** https://www.xmodulo.com/change-boot-splash-screen-ubuntu-linux-mint.html

## Some Cool Themes That I Found
### Theme for Arch
- https://www.gnome-look.org/p/1009531
- https://github.com/abrahammurciano/plymouth-theme-sweet-arch
- https://www.gnome-look.org/p/1000032

### Another cool themes
- https://www.gnome-look.org/p/1000045
- https://store.kde.org/p/1000045
- https://github.com/vikashraghavan/dotLock


# Obsidian Fix Empty Space
Fix the obsidian empty space on the left and right.
- Open Settings.
- In Editor, Turn off `Readable line length`.

If you want to use custom css. This only works if you **Turn On** `Readable line length`
- find the `.obsidian` file on that vault.
- Open it on any text editor and add this line.
```css
.markdown-source-view.is-readable-line-width .CodeMirror,
.markdown-preview-view.is-readable-line-width .CodeMirror,
.markdown-source-view.is-readable-line-width .markdown-preview-sizer,
.markdown-preview-view.is-readable-line-width .markdown-preview-sizer {
	max-width: 1000px;
	margin: auto;
}
```


# Linux Most Commonly Known Commands
**Source :** https://indianstudent.hashnode.dev/linux-commands

### Navigating Directories
- `ls` - list files and directories
- `cd` - change directory
- `pwd` - print working directory
- `cp` - copy files or directories
- `mv` - move or rename files or directories
- `rm` - remove or delete files and directories
- `mkdir` - create a new directory
- `rmdir` - remove or delete an empty directory
- `touch` - create a new empty file or update the timestamp of an existing file
- `cat` - display the contents of a file
- `grep` - search for a pattern in a file
- `find` - search for files and directories

### Archive
- `tar` - create or extract a tar archive
- `gzip` - compress or decompress a file

### Permissions
- `chmod` - change the permissions of a file or directory
- `chown` - change the ownership of a file or directory

### Remote
- `ssh` - connect to a remote server using SSH protocol
- `scp` - copy files to or from a remote server using SSH protocol
- `rsync` - synchronize files between local and remote servers

### Download Files
- `wget` - download files from the internet
- `curl` - transfer data from or to a server using various protocols

### Networking
- `ping` - test the connectivity between two network devices
- `traceroute` - display the route that packets take to reach a network device
- `netstat` - display network connections and statistics
- `ifconfig` - display network interface configuration
- `ip` - display and modify network interface configuration
- `route` - display and modify the kernel routing table
- `iptables` - set up and manage firewall rules

### System
- `systemctl` - control system services
- `journalctl` - view system logs
- `top` - display the processes running on a system, along with their resource usage statistics
- `ps` - display the processes running on a system
- `kill` - terminate a process
- `bg` - run a command in the background
- `fg` - bring a background process to the foreground
- `jobs` - display the status of background jobs
- `cron` - schedule tasks to run at specific times or intervals
- `at` - schedule a one-time task to run at a specific time
- `uptime` - display system uptime and load average

### Disk & File System
- `df` - display disk usage information
- `du` - display disk usage information for a directory or file
- `mount` - mount a file system
- `umount` - unmount a file system

### Check Logs
- `lsof` - list open files and processes
- `who` - display who is logged in
- `last` - display recent login history
- `history` - display the command history

### Read Files
- `less` - view a file one page at a time
- `more` - view a file one page at a time

### Manipulating Text Files
- `head` - display the first few lines of a file
- `tail` - display the last few lines of a file
- `diff` - compare two files line by line
- `patch` - apply a patch to a file
- `awk` - process and manipulate text files
- `sed` - process and manipulate text files
- `sort` - sort lines of text

# Convert Virtual Machines Image File Format

## `.vmdk` to `.qcow2`

### For Windows systems using PowerShell
```powershell
.\qemu-img.exe convert -p -f vmdk -O qcow2 fedora-linux.vmdk fedora-linux.qcow2
```

### For Linux systems using Bash
```bash
qemu-img convert -p -f vmdk -O qcow2 ./fedora-linux.vmdk ./fedora-linux.qcow2
```

## `.qcow2` to `.vmdk`

### For Windows systems using PowerShell

The reason I'm doing it like is because it's not only support VMware but ESXi aswell. But I have not try this one before, I believe it'll work just fine.
```powershell
.\qemu-img.exe convert -f qcow2 -O vmdk -o adapter_type=lsilogic,subformat=streamOptimized,compat6 fedora-linux.qcow2 fedora-linux.vmdk
```

### For Linux systems using Bash
```bash
qemu-img convert -p -f qcow2 -O vmdk fedora-linux.qcow2 fedora-linux.vmdk
```

# Just a reminder for myself

> [!NOTE]  
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action.