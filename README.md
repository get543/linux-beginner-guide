##### Click the title to go straight to the file

##### All `.sh` `.md` is clickable in this page

> **Note:** I use Zorin OS 16.1 at the time of writing. Some of the installation **will not** work if you are using distro other than **ubuntu based** distros.

> Before running the `.sh` file, make sure to make it as an executable file by running
> `chmod +x FileName.sh` on the terminal

> To run a `.sh` file. Add `./` in the beginning of the file name
> `./FileName.sh`

> To get a `.sh` file. Click the file in [`README.md`] and do `CTRL + S` to save it

# [`arch-vm.sh`]

My command to run arch vm using qemu.
You can read more on about qemu on [`Ultimate Guide For Beginner Linux User.md`].

# [`freeramcache.sh`]

Free swap memory.

# [`changing-output-device/`]

Scripts to change output device or switch between headphones and speakers easily.

## [`changing-output-device/change.sh`]

This script is using [zenity]. It should work ***if you enter the soundcard number and sink port correctly.***

**WARNING: THIS IS ONLY WORK WHEN YOU HAVE PULSEAUDIO AS YOUR AUDIO SERVER.**

## [`changing-output-device/toggle.sh`]

Same functionality as [`changing-output-device/change.sh`] but it is toggle instead, which means that you run this file again to change the output device. ***soundcard number*** and ***sink port*** has to be correctly setup. And you have to use ***pulseaudio*** as your default audio server.

**WARNING: THIS ONLY WORK FOR MY SPECIFIC SETUP. YOU CAN MODIFY THE SCRIPT TO AS YOU SEE FIT.**

## [`changing-output-device/change-output.desktop`]

Copy this file to `~/.local/share/applications`, if you want to run [`changing-output-device/change.sh`] without the terminal. After that, you need to change `Exec=` and `Icon=` to the path where you download [`changing-output-device/`] folder.

# [`autoinstall/`]

It contains the autoinstall scripts that can be use to install a lot of popular apps on linux. **_Don't move the file inside of it._**

## [`autoinstall/droidcam.sh`]

To troubleshoot droidcam including reinstalling and changing resolution.

## [`autoinstall/updates/`]

Scripts that take care of system updates.

## [`autoinstall/setups/`]

Setup before getting into installing some apps.

## [`autoinstall/apps/`]

Consist all app functions to install the apps.

# [`ytdlp.sh`]

- Commands to download video from youtube using [yt-dlp].
- Selected for the best 1080p60 video.
- Can also download a youtube playlist.
- For audio, the best 'audio only' (.m4a).

# [`Ultimate Guide For Beginner Linux User.md`]

- To troubleshoot problem that I face while trying to use linux for daily driver.
- Also contain tips and tricks to try.
- Tutorials, explanation, my config.
- Guide for installing arch with a script also the official arch wiki installation.

# [`starship.toml`]
My starship config. [Starship] is what I use to customise my bash prompt. Don't forget to use [nerd font], because compatibility is much better with the starship icon.

# [`picom.conf`]
XFCE compositor config file. Works well if you are running XFCE on VM and cannot use 3D Acceleration.

[zenity]: https://help.gnome.org/users/zenity/stable/
[yt-dlp]: https://github.com/yt-dlp/yt-dlp
[starship]: https://starship.rs
[nerd font]: https://www.nerdfonts.com/

[`arch-vm.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/arch-vm.sh
[`freeramcache.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/freeramcache.sh
[`ytdlp.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/ytdlp.sh
[`starship.toml`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/starship.toml
[`picom.conf`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/picom.conf

[`changing-output-device/`]: https://github.com/get543/linux-beginner-guide/tree/main/changing-output-device
[`changing-output-device/change.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/changing-output-device/change.sh
[`changing-output-device/toggle.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/changing-output-device/toggle.sh
[`changing-output-device/change-output.desktop`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/changing-output-device/change-output.desktop

[`autoinstall/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall
[`autoinstall/apps/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/apps
[`autoinstall/setups/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/setups
[`autoinstall/updates/`]: https://github.com/get543/linux-beginner-guide/tree/main/autoinstall/updates
[`autoinstall/droidcam.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/autoinstall/droidcam.sh

[`ultimate guide for beginner linux user.md`]: https://github.com/get543/linux-beginner-guide/blob/main/Ultimate%20Guide%20For%20Beginner%20Linux%20User.md
[`readme.md`]: https://github.com/get543/linux-beginner-guide/blob/main/README.md
