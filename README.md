##### Click the title to go straight to the file

##### All `.sh` `.md` is clickable in this page

> **Note:** I use Zorin OS 16.1 at the time of writing. Some of the installation **will not** work if you are using distro other than **ubuntu based** distros.

> Before running the `.sh` file, make sure to make it as an executable file by running
> `chmod +x FileName.sh` on the terminal

> To run a `.sh` file. Add `./` in the beginning of the file name
> `./FileName.sh`

> To get a `.sh` file. Click the file in [`README.md`] and do `CTRL + S` to save it

# [`Ultimate Guide For Beginner Linux User.md`]

- To troubleshoot problem that I face while trying to use linux for daily driver.
- Also contain tips and tricks to try.
- Tutorials, explanation, my config.
- Guide for installing arch with a script also the official arch wiki installation.

# [`utils/`]

Contains scripts that I use for automation my day to day task.

## [`arch-vm.sh`]

My command to run arch vm using qemu.
You can read more on about qemu on [`Ultimate Guide For Beginner Linux User.md`].

## [`freeramcache.sh`]

Free swap memory.

## [`ytdlp.sh`]

- Commands to download video from youtube using [yt-dlp].
- Selected for the best 1080p60 video.
- Can also download a youtube playlist.
- For audio, the best 'audio only' (.m4a).

# [`audio/`]

Scripts that is audio related. This is also automation script that I use daily.

## [`loopback.sh`]

A script to turn on or off loopback of your mic. In other words, a script to hear your own microphone.

- `./loopback.sh on` to turn it on.
- `./loopback.sh off` to turn it off.

## [`change-output-device/`]

Scripts to change output device or switch between headphones and speakers easily.

### [`change.sh`]

This script is using [zenity]. It should work **_if you enter the soundcard number and sink port correctly._**

**WARNING: THIS IS ONLY WORK WHEN YOU HAVE PULSEAUDIO AS YOUR AUDIO SERVER.**

### [`toggle.sh`]

Same functionality as [`change.sh`] but it is toggle instead, which means that you run this file again to change the output device. **_soundcard number_** and **_sink port_** has to be correctly setup. And you have to use **_pulseaudio_** as your default audio server.

**WARNING: THIS ONLY WORK FOR MY SPECIFIC SETUP. YOU CAN MODIFY THE SCRIPT TO AS YOU SEE FIT.**

### [`change-output.desktop`]

Copy this file to `~/.local/share/applications`, if you want to run [`change.sh`] without the terminal. After that, you need to change `Exec=` and `Icon=` to the path where you download [`change-output-device/`] folder.

# [`autoinstall/`]

It contains the autoinstall scripts that can be use to install a lot of popular apps on linux. **_Don't move the file inside of it._**

## [`droidcam.sh`]

To troubleshoot droidcam including reinstalling and changing resolution.

## [`autoinstall/updates/`]

Scripts that take care of system updates.

## [`autoinstall/setups/`]

Setup before getting into installing some apps.

## [`autoinstall/apps/`]

Consist all app functions to install the apps.

# [`config/`]

Configuration file.

## [`starship.toml`]

My starship config. [Starship] is what I use to customise my bash prompt. Don't forget to use [nerd font], because compatibility is much better with the starship icon.

## [`picom.conf`]

XFCE compositor config file. Works well if you are running XFCE on VM and cannot use 3D Acceleration.

## [`kitty.conf`]

My kitty (terminal emulator) config file. Not fully explored and not fully configured (still searching).

## [`change-perm.sh`]

Script to change usb or drive permission. It will change it to be able to have read, write, and execute permission.

[zenity]: https://help.gnome.org/users/zenity/stable/
[yt-dlp]: https://github.com/yt-dlp/yt-dlp
[starship]: https://starship.rs
[nerd font]: https://www.nerdfonts.com/

[`utils/`]: https://github.com/get543/linux-beginner-guide/tree/main/utils
[`arch-vm.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/utils/arch-vm.sh
[`freeramcache.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/utils/freeramcache.sh
[`ytdlp.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/utils/ytdlp.sh
[`change-perm.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/utils/change-perm.sh

[`config/`]: https://github.com/get543/linux-beginner-guide/tree/main/config
[`starship.toml`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/config/starship.toml
[`picom.conf`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/config/picom.conf
[`kitty.conf`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/config/kitty.conf

[`audio/`]: https://github.com/get543/linux-beginner-guide/tree/main/audio
[`loopback.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/audio/loopback.sh
[`change-output-device/`]: https://github.com/get543/linux-beginner-guide/tree/main/audio/change-output-device
[`change.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/audio/change-output-device/change.sh
[`toggle.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/audio/change-output-device/toggle.sh
[`change-output.desktop`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/audio/change-output-device/change-output.desktop

[`autoinstall/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall
[`autoinstall/apps/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/apps
[`autoinstall/setups/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/setups
[`autoinstall/updates/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/updates
[`droidcam.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/autoinstall/droidcam.sh

[`ultimate guide for beginner linux user.md`]: https://github.com/get543/linux-beginner-guide/blob/main/Ultimate%20Guide%20For%20Beginner%20Linux%20User.md
[`README.md`]: https://github.com/get543/linux-beginner-guide/blob/main/README.md
