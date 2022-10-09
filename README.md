##### Click the title to go straight to the file

##### All `.sh` `.md` is clickable in this page

> Note: I use Zorin OS 16.1 at the time of writing. Some of the installation **will not** work if you are using distro other than **ubuntu based** distros.

> Before running the `.sh` file, make sure to make it as an executable file by running
> `chmod +x FileName.sh` on the terminal

> To run a `.sh` file. Add `./` in the beginning of the file name
> `./FileName.sh`

> To get a `.sh` file. Click the file in [`README.md`] and do `CTRL + S` to save it

# [`arch-vm.sh`]

My command to run arch vm using qemu
You can read more on about qemu on [`Ultimate Guide For Beginner Linux User.md`]

# [`droidcam-install.sh`]

To troubleshoot droidcam including reinstalling, changing resolution

# [`freeramcache.sh`]

Free swap memory

# [`change.sh`]

Script to change output device (headhones and speakers), it is using zenity and it should work if you enter the soundcard number and sink port correctly.

# [`toggle.sh`]

Same functionality as [`change.sh`] but it is toggle, which means that you run this file again to change the output device. **_soundcard number and sink port has to be correctly setup_**

# [`install.sh`]

To install a lot of apps that I use on a daily basis

# [`ytdlp.sh`]

- Commands to download video from youtube using [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- Selected for the best 1080p60 video
- Can also download a youtube playlist
- For audio, the best 'audio only' (.m4a)

# [`flatpak-install.sh`]

Install flatpak for all distros. If your distro's not listed, it should problably installed by default. **_This file meant to run with [`install.sh`]_**

# [`upgrade.sh`]

For upgrading packages installed on your system. Also you can upgrade single or multiple packages just by typing the package's name **_This file meant to run with [`install.sh`]_**

# [`Ultimate Guide For Beginner Linux User.md`]

- To troubleshoot problem that I face while trying to use linux for daily driver
- Also contain tips and tricks to try
- Tutorials, explanation, my config
- Guide for installing arch with a script also the official arch wiki installation

[`arch-vm.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/arch-vm.sh
[`droidcam-install.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/droidcam-install.sh
[`freeramcache.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/freeramcache.sh
[`change.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/change-output/change.sh
[`toggle.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/change-output/toggle.sh
[`install.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/install.sh
[`ytdlp.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/ytdlp.sh
[`flatpak-install.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/flatpak-install.sh
[`upgrade.sh`]: https://raw.githubusercontent.com/get543/linux-beginner-guide/main/install/upgrade.sh
[`ultimate guide for beginner linux user.md`]: https://github.com/get543/linux-beginner-guide/blob/main/Ultimate%20Guide%20For%20Beginner%20Linux%20User.md
[`readme.md`]: https://github.com/get543/linux-beginner-guide/blob/main/README.md
