#!/bin/bash

BRed="\033[1;31m"
Color_Off="\033[0m"

DMagenta="\033[35m"
DYellow="\033[33m"
Green="\033[92m"

chmod u+x setups/*.sh
chmod u+x updates/*.sh
chmod u+x *.sh

# check nala
checkNala() {
  if ( ! command -v nala &> /dev/null )
  then
    echo -e "\n${BRed}nala ${Green}is ${BRed}not ${Green}installed. Using ${BRed}apt ${Green}instead.${Color_Off}\n"
  else
    # replace apt for nala
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
  fi
}

# check OS
checkFedoraRedhat() {
  fedoraRedhat=$(grep -Ei 'fedora|redhat' /etc/*release)
}

checkArch() {
  arch=$(grep -Ei 'arch' /etc/*release)
}

checkDebian() {
  debian=$(grep -Ei 'debian|buntu|mint' /etc/*release)
}

checkSUSE() {
  opensuse=$(grep -Ei 'SuSE' /etc/*release)
}

# menu function
createMenu() {
  zenity --title="$TITLE" \
        --text="$PROMPT" \
        --list \
        --column="$COLUMN1" \
        --column="$COLUMN2" \
        --column="$COLUMN3" \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        "${OPTIONS[@]}"
}

# choose no option
chooseOther() {
  zenity --notification --window-icon="error" --text="Invalid option. You didn't choose any of the options."
}

# app functions
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
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then

    echo -e "${DMagenta}
    --------------------------------------------------
    |               Installing Audacity              |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub org.audacityteam.Audacity

  else
    echo "Abort."
  fi
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
  echo -e "${DMagenta}
  --------------------------------------------------
  |              Installing Discord                |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub com.discordapp.Discord

  else
    if [ "$debian" ]
    then
      cd ~/Downloads
      wget -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
      sudo apt install ./discord.deb
    else
      echo "Only provided on debian packages (.deb)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
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

gimp() { # flatpak available
  echo -e "${DMagenta}
  --------------------------------------------------
  |               Installing GIMP                  |
  -------------------------------------------------- ${Color_Off}"

  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref

  else
    if [ "$debian" ]
    then
      sudo apt install gimp
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
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

gnome-tweaks() {
  echo -e "${DMagenta}
  --------------------------------------------------
  |            Installing Gnome Tweaks             |
  -------------------------------------------------- ${Color_Off}"
  sudo apt install gnome-tweaks
  sudo apt install gnome-shell-extensions

  echo -ne "\nInstall this firefox extension : \nhttps://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search"
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
  echo -e "${DMagenta}
  --------------------------------------------------
  |               Installing Inkscape              |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.inkscape.Inkscape

  else
    if [ "$debian" ]
    then
      sudo add-apt-repository ppa:inkscape.dev/stable
      sudo apt update
      sudo apt install inkscape
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
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
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |             Installing KolourPaint             |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub org.kde.kolourpaint

  else
    echo "Abort."
  fi
}

krita() { # flatpak only
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |             Installing KolourPaint             |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub org.kde.krita

  else
    echo "Abort."
  fi
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
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |              Installing Obsidian               |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub md.obsidian.Obsidian

  else
    echo "Abort."
  fi
}

openrgb() { # flatpak available
  echo -e "${DMagenta}
  --------------------------------------------------
  |              Installing OpenRGB                |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.openrgb.OpenRGB

  else
    if [ "$debian" ]
    then
      HEIGHT=400
      WIDTH=800
      TITLE="Choose Your Ubuntu Version"
      PROMPT="Ubuntu Version"
      COLUMN1="Version"
      COLUMN2="Description"
      COLUMN3=""
      OPTIONS=(
        20.10\ and\ older "choose this if you're running ubuntu 20.10 and lower" ""
        21.04\ and\ newer "choose this if you're running ubuntu 21.04 and later" ""
      )

      # menu
      opt=$(createMenu)

      case "$opt" in
        20.10\ and\ older)
          clear
          cd ~/Downloads
          wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_buster_6128731.deb -O openrgb-buster.deb
          sudo apt install ./openrgb-buster.deb
        ;;

        21.04\ and\ newer)
          clear
          cd ~/Downloads
          wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_bullseye_6128731.deb -O openrgb-bullseye.deb
          sudo apt install ./openrgb-bullseye.deb
        ;;

        *)
          chooseOther
        ;;
      esac
    else
      echo "Only provided in debian package (.deb)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
}

pinta() { # flatpak only
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |                Installing Pinta                |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub com.github.PintaProject.Pinta

  else
    echo "Abort."
  fi
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
    wget -O rambox-2.0.deb 'https://rambox.app/api/download?os=linux&package=deb'
    sudo apt install ./rambox-2.0.deb
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
  echo -e "${DMagenta}
  --------------------------------------------------
  |               Installing Spotify               |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub com.spotify.Client

  else
    if [ "$debian" ]
    then
      curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
      echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

      sudo apt-get update && sudo apt-get install spotify-client
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
}

telegram() { # flatpak only
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |         Installing Telegram Desktop            |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub org.telegram.desktop

  else
    echo "Abort."
  fi
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
  echo -e "${DMagenta}
  --------------------------------------------------
  |                  Installing VLC                |
  -------------------------------------------------- ${Color_Off}"
  echo -e "${BRed}If you choose no, it installs using snap."
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.videolan.VLC

  else
    if [ "$debian" ]
    then
      sudo snap install vlc
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
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
  echo -e "${Green}This package is only available in flatpak."
  echo -ne "${DYellow}Do you want to continue ? [Y/n] ${Color_Off}"
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |          Installing WhatsApp Desktop           |
    -------------------------------------------------- ${Color_Off}"
    flatpak install flathub io.github.mimbrero.WhatsAppDesktop

  else
    echo "Abort."
  fi
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
    COLUMN3=""
    OPTIONS=(
      18.04 "choose this if you're running ubuntu 18.04" ""
      20.04 "choose this if you're running ubuntu 20.04" ""
      22.04 "choose this if you're running ubuntu 21.04" ""
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
  echo -e "${DMagenta}
  --------------------------------------------------
  |                  Installing Zoom               |
  -------------------------------------------------- ${Color_Off}"
  echo -ne "${DYellow}Do you want to install it with flatpak ? [Y/n] ${Color_Off}"
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub us.zoom.Zoom

  else
    if [ "$debian" ]
    then
      clear
      cd ~/Downloads
      wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom_amd64.deb
      sudo apt install ./zoom_amd64.deb
    else
      echo "Only provided on debian based distros (apt)"
      echo -ne "Enter to continue... "
      read
    fi
  fi
}

installMissingDependecies() {
  HEIGHT=200
  WIDTH=600
  PROMPT="Install missing dependencies ?"
  TITLE="Dealing with Missing Dependencies"
  COLUMN1="Choose One"
  COLUMN2="Description"
  COLUMN3=""

  OPTIONS=(
    YES "continues to install missing dependencies" ""
    NO "skip this process" ""
  )

  clear

  # menu
  opt=$(createMenu)

  # case
  case "$opt" in
    YES)
      if [ "$debian" ]
      then
        sudo apt install --fix-broken
        sudo apt install -f

      elif [ "$fedoraRedhat" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on Fedora${Color_Off}"

      elif [ "$arch" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on Arch${Color_Off}"

      elif [ "$opensuse" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on OpenSUSE${Color_Off}"
      
      else
        echo -e "${Green}I'm sorry you're probably running distro other than.."
        echo -e "fedora/redhat, arch, debian/ubuntu, opensuse${Color_Off}"
        echo -e "working for other distro as well."
        echo -ne "\nEnter to continue... "
        read
      fi
    ;;
    
    NO)
      echo "Abort."
    ;;

    *)
      chooseOther
      installMissingDependecies
    ;;
  esac
}

removeUnused() {
  HEIGHT=200
  WIDTH=600
  PROMPT="Remove unnecessary packages ?"
  TITLE="Dealing with Unused Packages"
  COLUMN1="Choose One"
  COLUMN2="Description"
  COLUMN3=""

  OPTIONS=(
    YES "continues to remove unused packages" ""
    NO "skip this process" ""
  )

  clear

  # menu
  opt=$(createMenu)

  # case
  case "$opt" in
    YES)
      if [ "$debian" ]
      then
        sudo apt autoremove
        sudo apt clean

      elif [ "$fedoraRedhat" ]
      then
        sudo dnf autoremove
        sudo dnf clean all

      elif [ "$arch" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on Arch${Color_Off}"

      elif [ "$opensuse" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on OpenSUSE${Color_Off}"

      else
        echo -e "${Green}I'm sorry you're probably running distro other than.."
        echo -e "fedora/redhat, arch, debian/ubuntu, opensuse${Color_Off}"
        echo -e "working for other distro as well."
        echo -ne "\nEnter to continue... "
        read
      fi
    ;;

    NO)
      echo "Abort."
    ;;

    *)
      chooseOther
      removeUnused
    ;;
  esac
}

# export stuff
export -f createMenu
export -f chooseOther
export -f checkFedoraRedhat
export -f checkArch
export -f checkDebian
export -f checkSUSE
export -f checkNala
export BRed
export Color_Off
export DMagenta
export DYellow
export Green

# -------------------------------------------------------------------------------------
#                                 SCRIPT START
# -------------------------------------------------------------------------------------

# checking package
./setups/check-packages.sh

# update system
./updates/update.sh
./updates/upgrade.sh

while :
do
  HEIGHT=950
  WIDTH=950
  TITLE="AutoInstall"
  PROMPT="Choose What App You Want To Install"
  COLUMN1="Apps"
  COLUMN2="Description"
  COLUMN3="Flatpak Support"
  OPTIONS=(
    Ao "an unofficial, third-party, Microsoft To-Do desktop app" "NO"
    Audacity "audio recording and editing program" "YES"
    Autokey "control entire os with python script and keyboard shortcut" "NO"
    balena-etcher "a utility that allows you to create bootable USB drives" "NO"
    dconf\ Editor "customise gnome deeply, like registry editor on windows" "NO"
    Deckboard "turn your phone into a streamdeck" "NO"
    Discord "all-in-one voice and text chat for gamers" "YES"
    Droidcam "use your phone as a webcam" "NO"
    Geary "send and receive email (email client)" "NO"
    Git "to access git repo" "NO"
    GNU\ Image\ Manipulation\ Program\ \(GIMP\) "image editing software, like Photoshop" "YES"
    Gnome\ Tweaks "tweak advanced gnome 3 settings" "NO"
    Indicator-Sound-Switcher "sound input and output selector indicator" "NO"
    Inkscape "create and edits Scalable Vector Graphics (SVG) images" "YES"
    Kdenlive "video editing program by KDE" "YES"
    KolourPaint "an easy-to-use paint program" "YES"
    Krita "digital painting, creative freedom" "YES"
    Obsidian "application for taking notes based on markdown file" "YES"
    OBS\ Studio "streaming/recording software" "YES"
    OpenRGB "control rgb lighting of your peripherals" "NO"
    Pinta "program for drawing and image editing" "YES"
    pulseaudio\ and\ pavucontrol "sound server system" "NO"
    Rambox "an all-in-one messenger that lets you combine multiple services in one place" "NO"
    ScrCpy "display and control Android devices connected via USB" "NO"
    simplescreenrecorder "a feature rich screen recorder that supports X11 and OpenGL" "NO"
    Spotify "music streaming software" "YES"
    Telegram\ Desktop "messaging app" "YES"
    Visual\ Studio\ Code "code editor" "NO"
    Virtual\ Machine\ Manager "virtual machine (VM) based on QEMU" "NO"
    VLC "video/multimedia player" "YES"
    WhatsApp\ Desktop "messaging app" "YES"
    WINE "a compatibility layer to run windows applications on linux" "NO"
    yt-dlp "download youtube videos" "NO"
    Zoom "video conferencing app" "YES"
    "" "" ""
    Exit "exit this installing process if you are done" "-"
  )

  # check
  checkArch
  checkDebian
  checkFedoraRedhat
  checkSUSE
  checkNala

  clear

  # menu
  opt=$(createMenu)

  # case
  case "$opt" in
    Ao) ao ;;

    Audacity) audacity ;;

    Autokey) autokey ;;

    balena-etcher) balena-etcher ;;

    dconf\ Editor) dconf-editor ;;

    Deckboard) deckboard ;;

    Discord) discord ;;

    Droidcam) ./droidcam.sh ;;

    Geary) geary ;;

    GNU\ Image\ Manipulation\ Program\ \(GIMP\)) gimp ;;

    Git) git ;;

    Gnome\ Tweaks) gnome-tweaks ;;

    Indicator-Sound-Switcher) indicator-sound-switcher ;;

    Inkscape) inkscape ;;

    Kdenlive) kdenlive ;;

    KolourPaint) kolourpaint ;;

    Krita) krita ;;

    OBS\ Studio) obs-studio ;;

    Obsidian) obsidian ;;

    OpenRGB) openrgb ;;

    Pinta) pinta ;;

    pulseaudio\ and\ pavucontrol) pulseaudio ;;

    Rambox) rambox ;;

    ScrCpy) scrcpy ;;

    simplescreenrecorder) simplescreenrecorder ;;

    Spotify) spotify ;;

    Telegram\ Desktop) telegram ;;

    Virtual\ Machine\ Manager) virt-manager ;;

    VLC) vlc ;;

    Visual\ Studio\ Code) vscode ;;

    WhatsApp\ Desktop) whatsapp ;;

    WINE) wine ;;

    yt-dlp) ytdlp ;;

    Zoom) zoom ;;

    Exit)
      echo "Done."
      break
    ;;

    *) chooseOther ;;
  esac
done

# install missing dependencies
installMissingDependecies

# remove unused package
removeUnused
