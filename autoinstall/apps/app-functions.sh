ao () {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |                Installing Ao                   |
    -------------------------------------------------- ${Color_Off}"
    cd ~/Downloads
    wget https://github.com/klaussinani/ao/releases/download/v6.9.0/ao_6.9.0_amd64.deb -O ao-6.9-amd64.deb
    sudo apt install ./ao-6.9-amd64.deb
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi

}

audacity() { # flatpak only
  PACKAGENAME="Audacity"
  ID="org.audacityteam.Audacity"

  flatpakOnly
}

autokey() {
  if [ "$debian" ]
  then
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
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

balena-etcher() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing balena-etcher             |
    -------------------------------------------------- ${Color_Off}"
    curl -1sLf \
      'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
      | sudo -E bash

    sudo apt-get update
    sudo apt-get install balena-etcher-electron
  else
    echo "Only provided for debian installation"
    echo -ne "Enter to continue... "
    read
  fi
}

dconf-editor() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing dconf-editor              |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install dconf-editor
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

deckboard() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |             Installing Deckboard               |
    -------------------------------------------------- ${Color_Off}"
    cd ~/Downloads
    wget https://github.com/rivafarabi/deckboard/releases/download/v2.0.56/deckboard_2.0.56_amd64.deb -O deckboard_2.0.56.deb
    sudo apt install ./deckboard_2.0.56.deb
  else
    echo "Only provided in debian package (.deb)"
    echo -ne "Enter to continue... "
    read
  fi
}

discord() { # flatpak available
  APPNAME="Discord"
  APPID="com.discordapp.Discord"
  REGULARINSTALL() {
    cd ~/Downloads
    wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
    sudo apt install ./discord.deb
  }

  flatpakAvailable
}

geary() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |                Installing Geary                |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install geary
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

fragments() { # flatpak only
  PACKAGENAME="Fragments"
  ID="de.haeckerfelix.Fragments"

  flatpakOnly
}

gimp() { # flatpak available
  APPNAME="GIMP"
  APPID="org.gimp.GIMP"
  REGULARINSTALL() {
    sudo apt install gimp
  }

  flatpakAvailable
}

git() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |                 Installing Git                 |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install git
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

encfs() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |         Installing Gnome Encfs Manager         |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install gnome-encfs-manager
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

gnome-tweaks() {
  echo -e "${DMagenta}
  --------------------------------------------------
  |            Installing Gnome Tweaks             |
  -------------------------------------------------- ${Color_Off}"
  sudo apt install gnome-tweaks
  sudo apt install gnome-shell-extensions

  echo -ne "\nInstall this firefox extension : ${BRed}\nhttps://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search \n${Color_Off}"
  echo "And you're good :)"
  echo -ne "Press Enter to continue... "
  read
}

indicator-sound-switcher() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |      Installing Indicator-Sound-Switcher       |
    -------------------------------------------------- ${Color_Off}"
    sudo apt-add-repository ppa:yktooo/ppa
    sudo apt-get update
    sudo apt-get install indicator-sound-switcher
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

inkscape() { # flatpak available
  APPNAME="Inkscape"
  APPID="org.inkscape.Inkscape"
  REGULARINSTALL() {
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt update
    sudo apt install inkscape
  }

  flatpakAvailable
}

kdenlive() {
  echo -e "${DMagenta}
  --------------------------------------------------
  |                Installing Kdenlive             |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.kde.kdenlive

  else
    if [ "$debian" ]
    then
      sudo add-apt-repository ppa:kdenlive/kdenlive-stable
      sudo apt-get update
      sudo apt-get install kdenlive
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
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

obs-studio() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |             Installing OBS Studio              |
    -------------------------------------------------- ${Color_Off}"
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install ffmpeg obs-studio
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

obsidian() { # flatpak only
  PACKAGENAME="Obsidian"
  ID="md.obsidian.Obsidian"

  flatpakOnly
}

openrgb() { # flatpak available
  APPNAME="OpenRGB"
  APPID="org.openrgb.OpenRGB"
  REGULARINSTALL() {
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
      ;;

      21.04\ and\ newer)
        cd ~/Downloads
        wget https://openrgb.org/releases/release_0.8/openrgb_0.8_amd64_bullseye_fb88964.deb -O openrgb_0.8_bullseye.deb
        sudo apt install ./openrgb_0.8_bullseye.deb
      ;;

      22.04\ LTS\ and\ newer)
        cd ~/Downloads
        wget https://openrgb.org/releases/release_0.8/openrgb_0.8_amd64_bookworm_fb88964.deb -O openrgb_0.8_bookwarm.deb
        sudo apt install ./openrgb_0.8_bookwarm.deb
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

pulseaudio() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |      Installing pulseaudio and pavucontrol     |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install pulseaudio pavucontrol
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

rambox() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |               Installing Rambox                |
    -------------------------------------------------- ${Color_Off}"
    cd ~/Downloads
    wget "https://rambox.app/api/download?os=linux&package=deb" -O rambox_2.0.deb
    sudo apt install ./rambox_2.0.deb
  else
    echo "Only provided in debian package (.deb)"
    echo -ne "Enter to continue... "
    read
  fi
}

scrcpy() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |               Installing ScrCpy                |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install scrcpy
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

simplescreenrecorder() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |         Installing simplescreenrecorder        |
    -------------------------------------------------- ${Color_Off}"
    sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
    sudo apt-get update
    sudo apt-get install simplescreenrecorder
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

spotify() { # flatpak available
  APPNAME="Spotify"
  APPID="com.spotify.Client"
  REGULARINSTALL() {
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    sudo apt-get update && sudo apt-get install spotify-client
  }

  flatpakAvailable
}

telegram() { # flatpak only
  PACKAGENAME="Telegram"
  ID="org.telegram.desktop"

  flatpakOnly
}

virt-manager() {
  if [ "$debian" ]
  then
    virtualization=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
    echo "cpuinfo vm|svmx = $virtualization"

    if [ $virtualization > 0 ]
    then
      echo -e "${Green}You have enabled virtualization on your machine${Color_Off}"
      echo -e "${DMagenta}
      --------------------------------------------------
      |       Installing Virtual Machine Manager       |
      -------------------------------------------------- ${Color_Off}"
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

  else
    echo "Only provided setup for debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

vlc() { # flatpak available
  APPNAME="VLC"
  APPID="org.videolan.VLC"
  REGULARINSTALL() {
    echo -e "${BRed}For this one there is no other option but using snap${Color_Off}"
    sudo snap install vlc
  }

  flatpakAvailable
}

vscode() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |         Installing Visual Studio Code          |
    -------------------------------------------------- ${Color_Off}"
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

whatsapp() { # flatpak only
  PACKAGENAME="WhatsApp"
  ID="io.github.mimbrero.WhatsAppDesktop"

  flatpakOnly
}

wine() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |                 Installing WINE                |
    -------------------------------------------------- ${Color_Off}"
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

  else
    echo "Only provided setup for debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

ytdlp() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |              Installing yt-dlp                 |
    -------------------------------------------------- ${Color_Off}"
    sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
  else
    echo "Only provided on debian based distros (apt)"
    echo -ne "Enter to continue... "
    read
  fi
}

zoom() { # flatpak available
  APPNAME="Zoom"
  APPID="us.zoom.Zoom"
  REGULARINSTALL() {
    cd ~/Downloads
    wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
  }

  flatpakAvailable
}