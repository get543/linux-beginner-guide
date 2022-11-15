##### Click the title to go straight to the file

##### All `.sh` `.md` is clickable in this page

> **Note:** I use Zorin OS 16.1 at the time of writing. Some of the installation **will not** work if you are using distro other than **ubuntu based** distros.

> Before running the `.sh` file, make sure to make it as an executable file by running
> `chmod +x FileName.sh` on the terminal

> To run a `.sh` file. Add `./` in the beginning of the file name
> `./FileName.sh`

> To get a `.sh` file. Click the file in [`README.md`] and do `CTRL + S` to save it

# [`arch-vm.sh`]

My command to run arch vm using qemu
You can read more on about qemu on [`Ultimate Guide For Beginner Linux User.md`]

# [`droidcam.sh`]

To troubleshoot droidcam including reinstalling, changing resolution

# [`freeramcache.sh`]

Free swap memory

# [`change-output/`]

##### Contains :

- [`change.sh`] => to change output device (headhones and speakers), using [zenity] and it should work **_if you enter the soundcard number and sink port correctly._**
- [`toggle.sh`] => just like [`change.sh`] but it is toggle, which means that you run this file again to change the output device. **_soundcard number and sink port has to be correctly setup_**

# [`install/`]

It contains the autoinstall scripts. Don't move the file inside of it.

# [`ytdlp.sh`]

- Commands to download video from youtube using [yt-dlp]
- Selected for the best 1080p60 video
- Can also download a youtube playlist
- For audio, the best 'audio only' (.m4a)

# [`Ultimate Guide For Beginner Linux User.md`]

- To troubleshoot problem that I face while trying to use linux for daily driver
- Also contain tips and tricks to try
- Tutorials, explanation, my config
- Guide for installing arch with a script also the official arch wiki installation

[zenity]: https://help.gnome.org/users/zenity/stable/
[yt-dlp]: https://github.com/yt-dlp/yt-dlp
[`arch-vm.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/arch-vm.sh
[`droidcam.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/droidcam.sh
[`freeramcache.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/freeramcache.sh
[`change.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/change-output/change.sh
[`toggle.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/change-output/toggle.sh
[`install/`]: https://github.com/get543/linux-beginner-guide/tree/main/install
[`change-output/`]: https://github.com/get543/linux-beginner-guide/tree/main/change-output
[`ytdlp.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/ytdlp.sh
[`flatpak-install.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/flatpak-install.sh
[`upgrade.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/upgrade.sh
[`ultimate guide for beginner linux user.md`]: https://github.com/get543/linux-beginner-guide/blob/main/Ultimate%20Guide%20For%20Beginner%20Linux%20User.md
[`readme.md`]: https://github.com/get543/linux-beginner-guide/blob/main/README.md
