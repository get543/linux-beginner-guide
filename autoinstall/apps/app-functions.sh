ao () { # default install only
  NAME="Ao"
  DEBIANSETUP() {
    cd ~/Downloads
    wget https://github.com/klaudiosinani/ao/releases/download/v6.9.0/ao_6.9.0_amd64.deb -O ao-6.9-amd64.deb
    sudo apt install ./ao-6.9-amd64.deb
    rmdirIfExist ~/Downloads/ao-6.9-amd64.deb
    sleep 5
  }

  defaultInstallOnly
}

audacity() { # flatpak only
  PACKAGENAME="Audacity"
  ID="org.audacityteam.Audacity"

  flatpakOnly
}

autokey() { # default install only
  NAME="autokey"
  DEBIANSETUP() {
    HEIGHT=400
    WIDTH=800
    TITLE="Which Version ?"
    PROMPT="Which version of autokey you want to install"
    COLUMN1="Version"
    COLUMN2="Description"
    COLUMN3=""
    OPTIONS=(
      autokey-gtk "GTK+ version" ""
      autokey-qt "Qt version" ""
    )

    opt=$(createMenu)

    case "$opt" in
      autokey-gtk)
        echo -e "${DMagenta}
        --------------------------------------------------
        |           Installing autokey-gtk               |
        -------------------------------------------------- ${Color_Off}"
        sudo apt install autokey-gtk
      ;;

      autokey-qt)
        echo -e "${DMagenta}
        --------------------------------------------------
        |           Installing autokey-qt                |
        -------------------------------------------------- ${Color_Off}"
        sudo apt install autokey-qt
      ;;

      *) chooseOther ;;
    esac
  }

  defaultInstallOnly
}

balena-etcher() { # default install only
  NAME="balena-etcher"
  DEBIANSETUP() {
    curl -1sLf \
      'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
      | sudo -E bash

    sudo apt-get update
    sudo apt-get install balena-etcher-electron
  }

  defaultInstallOnly
}

dconf-editor() { # default install only
  NAME="dconf-editor"
  DEBIANSETUP() {
    sudo apt install dconf-editor
  }

  defaultInstallOnly
}

deckboard() { # default install only
  NAME="Deckboard"
  DEBIANSETUP() {
    cd ~/Downloads
    wget https://github.com/rivafarabi/deckboard/releases/download/v2.0.56/deckboard_2.0.56_amd64.deb -O deckboard_2.0.56.deb
    sudo apt install ./deckboard_2.0.56.deb
    rmdirIfExist ~/Downloads/deckboard_2.0.56.deb
    sleep 5
  }

  defaultInstallOnly
}

discord() { # flatpak available
  APPNAME="Discord"
  APPID="com.discordapp.Discord"
  REGULAR_DEBIAN_INSTALL() {
    cd ~/Downloads
    wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
    sudo apt install ./discord.deb
    rmdirIfExist ~/Downloads/discord.deb
    sleep 5
  }

  flatpakAvailable
}

geary() { # default install only
  NAME="Geary"
  DEBIANSETUP() {
    sudo apt install geary
  }

  defaultInstallOnly
}

fragments() { # flatpak only
  PACKAGENAME="Fragments"
  ID="de.haeckerfelix.Fragments"

  flatpakOnly
}

gimp() { # flatpak available
  APPNAME="GIMP"
  APPID="org.gimp.GIMP"
  REGULAR_DEBIAN_INSTALL() {
    sudo apt install gimp
  }

  flatpakAvailable
}

git() { # default install only
  NAME="Git"
  DEBIANSETUP() {
    sudo apt install git
  }

  defaultInstallOnly
}

encfs() { # default install only
  NAME="Gnome Encfs Manager"
  DEBIANSETUP() {
    sudo apt install gnome-encfs-manager
  }

  defaultInstallOnly
}

gnome-tweaks() { # default install only
  NAME="Gnome Tweaks"
  DEBIANSETUP() {
    sudo apt install gnome-tweaks
    sudo apt install gnome-shell-extensions

    echo -e "\nInstall this firefox extension :"
    echo -e "${BRed}https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search ${Color_Off}"
    echo "And you're good :)"
    echo -ne "Press Enter to continue... "
    read
  }

  defaultInstallOnly
}

indicator-sound-switcher() { # default install only
  NAME="Indicator-Sound-Switcher"
  DEBIANSETUP() {
    sudo apt-add-repository ppa:yktooo/ppa
    sudo apt-get update
    sudo apt-get install indicator-sound-switcher
  }

  defaultInstallOnly
}

inkscape() { # flatpak available
  APPNAME="Inkscape"
  APPID="org.inkscape.Inkscape"
  REGULAR_DEBIAN_INSTALL() {
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt update
    sudo apt install inkscape
  }

  flatpakAvailable
}

kdenlive() { # flatpak available
  APPNAME="Kdenlive"
  APPID="org.kde.kdenlive"
  REGULAR_DEBIAN_INSTALL() {
    sudo add-apt-repository ppa:kdenlive/kdenlive-stable
    sudo apt-get update
    sudo apt-get install kdenlive
  }

  flatpakAvailable
}

kolourpaint() { # flatpak only
  PACKAGENAME="KolourPaint"
  ID="org.kde.kolourpaint"

  flatpakOnly
}

krita() { # flatpak only
  PACKAGENAME="Krita"
  ID="org.kde.krita"

  flatpakOnly
}

obs-studio() { # default install only
  NAME="OBS Studio"
  DEBIANSETUP() {
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install ffmpeg obs-studio
  }

  defaultInstallOnly
}

obsidian() { # flatpak only
  PACKAGENAME="Obsidian"
  ID="md.obsidian.Obsidian"

  flatpakOnly
}

openrgb() { # flatpak available
  APPNAME="OpenRGB"
  APPID="org.openrgb.OpenRGB"
  REGULAR_DEBIAN_INSTALL() {
    HEIGHT=400
    WIDTH=800
    TITLE="Choose Your Ubuntu Version"
    PROMPT="Ubuntu Version"
    COLUMN1="Version"
    COLUMN2="Description"
    COLUMN3=""
    OPTIONS=(
      20.10\ and\ older "for Ubuntu 20.10 and older, for Ubuntu 20.04 LTS" ""
      21.04\ and\ newer "for Ubuntu 21.04 and newer" ""
      22.04\ LTS\ and\ newer "for Ubuntu 22.04 LTS and newer" ""
    )

    # menu
    opt=$(createMenu)

    case "$opt" in
      20.10\ and\ older)
        cd ~/Downloads
        wget https://openrgb.org/releases/release_0.8/openrgb_0.8_amd64_buster_fb88964.deb -O openrgb_0.8_buster.deb
        sudo apt install ./openrgb_0.8_buster.deb
        rmdirIfExist ~/Downloads/openrgb_0.8_buster.deb
        sleep 5
      ;;

      21.04\ and\ newer)
        cd ~/Downloads
        wget https://openrgb.org/releases/release_0.8/openrgb_0.8_amd64_bullseye_fb88964.deb -O openrgb_0.8_bullseye.deb
        sudo apt install ./openrgb_0.8_bullseye.deb
        rmdirIfExist ~/Downloads/openrgb_0.8_bullseye.deb
        sleep 5
      ;;

      22.04\ LTS\ and\ newer)
        cd ~/Downloads
        wget https://openrgb.org/releases/release_0.8/openrgb_0.8_amd64_bookworm_fb88964.deb -O openrgb_0.8_bookwarm.deb
        sudo apt install ./openrgb_0.8_bookwarm.deb
        rmdirIfExist ~/Downloads/openrgb_0.8_bookwarm.deb
        sleep 5
      ;;

      *)
        chooseOther
      ;;
    esac
  }

  flatpakAvailable
}

pinta() { # flatpak only
  PACKAGENAME="Pinta"
  ID="com.github.PintaProject.Pinta"

  flatpakOnly
}

pulseaudio() { # default install only
  NAME="pulseaudio and pavucontrol"
  DEBIANSETUP() {
    sudo apt install pulseaudio pavucontrol
  }

  defaultInstallOnly
}

rambox() { # default install only
  NAME="Rambox"
  DEBIANSETUP() {
    cd ~/Downloads
    wget "https://rambox.app/api/download?os=linux&package=deb" -O rambox_2.0.deb
    sudo apt install ./rambox_2.0.deb
    rmdirIfExist ~/Downloads/rambox_2.0.deb
    sleep 5
  }

  defaultInstallOnly
}

scrcpy() { # default install only
  NAME="ScrCpy"
  DEBIANSETUP() {
    sudo apt install scrcpy
  }

  defaultInstallOnly
}

simplescreenrecorder() { # default install only
  NAME="simplescreenrecorder"
  DEBIANSETUP() {
    sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
    sudo apt-get update
    sudo apt-get install simplescreenrecorder
  }

  defaultInstallOnly
}

spotify() { # flatpak available
  APPNAME="Spotify"
  APPID="com.spotify.Client"
  REGULAR_DEBIAN_INSTALL() {
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    sudo apt-get update && sudo apt-get install spotify-client
  }

  flatpakAvailable
}

starship() {
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
}

telegram() { # flatpak only
  PACKAGENAME="Telegram"
  ID="org.telegram.desktop"

  flatpakOnly
}

virt-manager() { # default install only
  NAME="Virtual Machine Manager"
  DEBIANSETUP() {
    virtualization=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
    echo "cpuinfo vm|svmx = $virtualization"

    if [ $virtualization > 0 ]
    then
      echo -e "${Green}You have enabled virtualization on your machine."
      echo -e "Installing necessary packages.${Color_Off}"
      sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

      echo -e "${Green}Verify that libvirt is running.${Color_Off}"
      sudo systemctl status libvirtd.service | grep running

      echo -e "${Green}Setting up network by default and autostart.${Color_Off}"
      sudo virsh net-start default
      sudo virsh net-autostart default

      echo -e "${Green}Checking network status.${Color_Off}"
      sudo virsh net-list --all

      echo -e "${Green}Adding libvirt user.${Color_Off}"
      sudo adduser $(whoami) libvirt
      sudo adduser $(whoami) libvirt-qemu

    elif [ $virtualization = 0 ]
    then
      echo -e "\n${Green}If the number shows 0, then enable virtualization on bios settings"
      echo -e "Enable VT-x (Virtualization Technology Extension) for Intel processor"
      echo -e "Enable AMD-V for AMD processor${Color_Off}"

      break
    fi
  }

  defaultInstallOnly
}

vlc() { # flatpak available
  APPNAME="VLC"
  APPID="org.videolan.VLC"
  REGULAR_DEBIAN_INSTALL() {
    echo -e "${BRed}For this one there is no other option but using snap${Color_Off}"
    sudo snap install vlc
  }

  flatpakAvailable
}

vscode() { # default install only
  NAME="Visual Studio Code"
  DEBIANSETUP() {
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
  }

  defaultInstallOnly
}

whatsapp() { # flatpak only
  PACKAGENAME="WhatsApp"
  ID="io.github.mimbrero.WhatsAppDesktop"

  flatpakOnly
}

wine() { # default install only
  NAME="WINE"
  DEBIANSETUP() {
    sudo dpkg --add-architecture i386
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

    HEIGHT=400
    WIDTH=800
    TITLE="Choose Your Ubuntu Version"
    PROMPT="Ubuntu Version"
    COLUMN1="Version"
    COLUMN2="Description"
    COLUMN3="Code Name"
    OPTIONS=(
      18.04 "for Ubuntu 18.04 LTS" "Bionic Beaver"
      20.04 "for Ubuntu 20.04 LTS" "Focal Fossa"
      22.04 "for Ubuntu 21.04 LTS" "Jammy Jellyfish"
    )

    opt=$(createMenu)

    case "$opt" in
      18.04)
        wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources
        sudo mv winehq-bionic.sources /etc/apt/sources.list.d/
      ;;

      20.04)
        wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
        sudo mv winehq-focal.sources /etc/apt/sources.list.d/
      ;;

      22.04)
        wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
        sudo mv winehq-jammy.sources /etc/apt/sources.list.d/
      ;;

      *)
        chooseOther
        createMenu
      ;;
    esac

    sudo apt update
    sudo apt install --install-recommends winehq-stable
  }

  defaultInstallOnly
}

ytdlp() { # default install only
  NAME="dconf-editor"
  DEBIANSETUP() {
    sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
  }

  defaultInstallOnly
}

zoom() { # flatpak available
  APPNAME="Zoom"
  APPID="us.zoom.Zoom"
  REGULAR_DEBIAN_INSTALL() {
    cd ~/Downloads
    wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    rmdirIfExist ~/Downloads/zoom_amd64.deb
    sleep 5
  }

  flatpakAvailable
}