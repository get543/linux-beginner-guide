ao () { # default install only
  NAME="Ao"
  VERSION=$(curl -s "https://api.github.com/repos/klaudiosinani/ao/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  DEBIANSETUP() {
    cd ~/Downloads
    curl -o "ao_${VERSION}.deb" -fLC - "https://github.com/klaudiosinani/ao/releases/latest/download/ao_${VERSION}_amd64.deb"
    sudo apt install ./ao_${VERSION}.deb
    rmdirIfExist ~/Downloads/ao_${VERSION}.deb
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
  VERSION=$(curl -s "https://api.github.com/repos/rivafarabi/deckboard/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  DEBIANSETUP() {
    cd ~/Downloads
    curl -o "deckboard_${VERSION}.deb" -fLC - "https://github.com/rivafarabi/deckboard/releases/latest/download/deckboard_${VERSION}_amd64.deb"
    sudo apt install ./deckboard_${VERSION}.deb
    rmdirIfExist ~/Downloads/deckboard_${VERSION}.deb
    sleep 5
  }

  defaultInstallOnly
}

discord() { # flatpak available
  APPNAME="Discord"
  APPID="com.discordapp.Discord"
  REGULAR_DEBIAN_INSTALL() {
    cd ~/Downloads
    curl -o "discord.deb" -fLC - "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install ./discord.deb
    rmdirIfExist ~/Downloads/discord.deb
    sleep 5
  }

  flatpakAvailable
}

docker() { # custom
  NAME="Docker"
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  cd ~/Downloads
  curl -FsSL https://get.docker.com/ -o docker-install.sh
  chmod +x docker-install.com
  sudo ./docker-install.sh

  echo "Github: https://github.com/docker/docker-install"
  sleep 5
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

gcloudcli() { # custom
  NAME="Google Cloud CLI"
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  cd ~
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-417.0.1-linux-x86_64.tar.gz
  tar -xfv google-cloud-cli-417.0.1-linux-x86.tar.gz
  ./google-cloud-sdk/install.sh
  rmdirIfExist ~/google-cloud-cli-417.0.1-linux-x86.tar.gz

  sleep 5
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

joplin() { # custom
  NAME="Joplin"
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
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

lazygit() { # default install only
  NAME="lazygit"
  DEBIANSETUP() {
    cd ~/Downloads
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xfv lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    
    rmdirIfExist ~/Downloads/lazygit.tar.gz
    rmdirIfExist ~/Downloads/lazygit

    sleep 5
  }
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

    VERSION=0.8

    case "$opt" in
      20.10\ and\ older)
        cd ~/Downloads
        curl -o "openrgb_${VERSION}_buster.deb" -fLC - "https://openrgb.org/releases/release_${VERSION}/openrgb_${VERSION}_amd64_buster_fb88964.deb"
        sudo apt install ./openrgb_${VERSION}_buster.deb
        rmdirIfExist ~/Downloads/openrgb_${VERSION}_buster.deb
        sleep 5
      ;;

      21.04\ and\ newer)
        cd ~/Downloads
        curl -o "openrgb_${VERSION}_bullseye.deb" -fLC - "https://openrgb.org/releases/release_${VERSION}/openrgb_${VERSION}_amd64_bullseye_fb88964.deb"
        sudo apt install ./openrgb_${VERSION}_bullseye.deb
        rmdirIfExist ~/Downloads/openrgb_${VERSION}_bullseye.deb
        sleep 5
      ;;

      22.04\ LTS\ and\ newer)
        cd ~/Downloads
        curl -o "openrgb_${VERSION}_bookwarm.deb" -fLC - "https://openrgb.org/releases/release_${VERSION}/openrgb_${VERSION}_amd64_bookworm_fb88964.deb"
        sudo apt install ./openrgb_${VERSION}_bookwarm.deb
        rmdirIfExist ~/Downloads/openrgb_${VERSION}_bookwarm.deb
        sleep 5
      ;;

      *)
        chooseOther
      ;;
    esac
  }

  flatpakAvailable
}

phoneinfoga() {
  NAME="PhoneInfoga"
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install | bash
  sudo install ./phoneinfoga /usr/local/bin/phoneinfoga
  ./phoneinfoga version

  echo "Github : https://github.com/sundowndev/phoneinfoga"
  sleep 5
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
    curl -o "rambox_2.0.deb" -fLC - "https://rambox.app/api/download?os=linux&package=deb"
    sudo apt install ./rambox_2.0.deb
    rmdirIfExist ~/Downloads/rambox_2.0.deb
    sleep 5
  }

  defaultInstallOnly
}

scrcpy() { # default install or build source
  HEIGHT=400
  WIDTH=900
  TITLE="How do you want to install ScrCpy ?"
  PROMPT="Method"
  COLUMN1="Name"
  COLUMN2="Description"
  COLUMN3="Note"
  OPTIONS=(
    Default\ Repo "using default repository of your distribution" "not the newest version installed"
    Build\ From\ Source "using repository from github" "getting the latest version, but need to rebuild to update"
  )

  opt=$(createMenu)

  case "$opt" in
    Default\ Repo)
      NAME="ScrCpy"
      DEBIANSETUP() {
        sudo apt install scrcpy
      }

      defaultInstallOnly
    ;;

    Build\ From\ Source)
      NAME="ScrCpy"
      PREREQUISITE() {
        if [ "$debian" ]
        then
          PACKMAN="apt install"
        elif [ "$arch" ]
        then
          PACKMAN="pacman -Sy"
        elif [ "$fedoraRedhat" ]
        then
          PACKMAN="dnf install"
        elif [ "$opensuse" ]
        then
          PACKMAN="zypper install"
        else
          exit 1
        fi

        sudo $PACKMAN ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libusb-1.0-0 libusb-1.0-0-dev
      }
      INSTALLATION() {
        cd ~/Downloads
        git clone https://github.com/Genymobile/scrcpy
        cd scrcpy
        ./install_release.sh
      }

      buildFromSource

      echo "Github: https://github.com/Genymobile/scrcpy"
      sleep 5
    ;;

    *)
      chooseOther
    ;;
  esac
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
  NAME="starship"
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
  sleep 5
}

telegram() { # flatpak only
  PACKAGENAME="Telegram"
  ID="org.telegram.desktop"

  flatpakOnly
}

universal-android-debloater() {
  NAME="Universal Android Debloater"
  VERSION=0.5.1
  echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
  cd ~/Downloads
  curl -o "uad_gui-linux.tar.gz" -fLC - "https://github.com/0x192/universal-android-debloater/releases/download/$VERSION/uad_gui-linux.tar.gz"
  tar xfvz uad_gui-linux.tar.gz
  rmdirIfExist ~/Downloads/uad_gui-linux.tar.gz

  echo "Github: https://github.com/0x192/universal-android-debloater"
  sleep 5
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
    curl -o "zoom_amd64.deb" -fLC - "https://zoom.us/client/latest/zoom_amd64.deb"
    sudo apt install ./zoom_amd64.deb
    rmdirIfExist ~/Downloads/zoom_amd64.deb
    sleep 5
  }

  flatpakAvailable
}