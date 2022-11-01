#!/bin/bash

BRed='\033[1;31m'
Color_Off='\033[0m'

chmod u+x setups/*.sh
chmod u+x updates/*.sh
chmod u+x *.sh

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
ao() {
  echo "
  --------------------------------------------------
  |                Installing Ao                   |
  --------------------------------------------------"
  wget https://github.com/klaussinani/ao/releases/download/v6.9.0/ao_6.9.0_amd64.deb -O ~/Downloads/ao-6.9-amd64.deb
  cd ~/Downloads
  sudo apt install ./ao-6.9-amd64.deb
}

audacity() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then

    echo "
    --------------------------------------------------
    |               Installing Audacity              |
    --------------------------------------------------"
    flatpak install flathub org.audacityteam.Audacity

  else
    echo "Abort."
  fi
}

autokey() {
  HEIGHT=400
  WIDTH=800
  TITLE="Which Version ?"
  PROMPT="Which version of autokey you want to install"
  COLUMN1="Version"
  COLUMN2="Description"
  OPTIONS=(
    autokey-gtk "GTK+ version"
    autokey-qt "Qt version"
  )

  opt=$(createMenu)

  case "$opt" in
    autokey-gtk)
      echo "
      --------------------------------------------------
      |           Installing autokey-gtk               |
      --------------------------------------------------"
      sudo apt install autokey-gtk
    ;;

    autokey-qt)
      echo "
      --------------------------------------------------
      |           Installing autokey-qt                |
      --------------------------------------------------"
      sudo apt install autokey-qt
    ;;

    *) chooseOther ;;
  esac
}

balena-etcher() {
  echo "
  --------------------------------------------------
  |           Installing balena-etcher             |
  --------------------------------------------------"
  curl -1sLf \
    'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
    | sudo -E bash

  sudo apt-get update
  sudo apt-get install balena-etcher-electron
}

dconf-editor() {
  echo "
  --------------------------------------------------
  |           Installing dconf-editor              |
  --------------------------------------------------"
  sudo apt install dconf-editor
}

deckboard() {
  echo "
  --------------------------------------------------
  |             Installing Deckboard               |
  --------------------------------------------------"
  wget https://github.com/rivafarabi/deckboard/releases/download/v2.0.2/deckboard_2.0.2_amd64.deb -O ~/Downloads/deckboard_2.0.2.deb
  cd ~/Downloads
  sudo apt install ./deckboard_2.0.2.deb
  sudo apt --fix-broken install
  sudo apt install ./deckboard_2.0.2.deb
}

discord() {
  echo "
  --------------------------------------------------
  |              Installing Discord                |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub com.discordapp.Discord

  else
    cd ~/Downloads
    wget -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
    sudo apt install ./discord.deb
  fi
}

geary() {
  echo "
  --------------------------------------------------
  |                Installing Geary                |
  --------------------------------------------------"
  sudo apt install geary
}

gimp() {
  echo "
  --------------------------------------------------
  |               Installing GIMP                  |
  --------------------------------------------------"

  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref

  else
    sudo apt install gimp
  fi
}

git() {
  echo "
  --------------------------------------------------
  |                 Installing Git                 |
  --------------------------------------------------"
  sudo apt install git
}

gnome-tweaks() {
  echo "
  --------------------------------------------------
  |            Installing Gnome Tweaks             |
  --------------------------------------------------"
  sudo apt install gnome-tweaks
  sudo apt install gnome-shell-extensions
  echo -ne "\nInstall this firefox extension : \nhttps://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search"
  echo "And you're good :)"
  echo -ne "Press Enter to continue.. "
  read
}

indicator-sound-switcher() {
  echo "
  --------------------------------------------------
  |      Installing Indicator-Sound-Switcher       |
  --------------------------------------------------"
  sudo apt-add-repository ppa:yktooo/ppa
  sudo apt-get update
  sudo apt-get install indicator-sound-switcher
}

inkscape() {
  echo "
  --------------------------------------------------
  |               Installing Inkscape              |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.inkscape.Inkscape

  else
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt update
    sudo apt install inkscape
  fi
}

kdenlive() {
  echo "
  --------------------------------------------------
  |                Installing Kdenlive             |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.kde.kdenlive

  else
    sudo add-apt-repository ppa:kdenlive/kdenlive-stable
    sudo apt-get update
    sudo apt-get install kdenlive
  fi
}

kolourpaint() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo "
    --------------------------------------------------
    |             Installing KolourPaint             |
    --------------------------------------------------"
    flatpak install flathub org.kde.kolourpaint

  else
    echo "Abort."
  fi
}

krita() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo "
    --------------------------------------------------
    |             Installing KolourPaint             |
    --------------------------------------------------"
    flatpak install flathub org.kde.krita

  else
    echo "Abort."
  fi
}

obs-studio() {
  echo "
  --------------------------------------------------
  |             Installing OBS Studio              |
  --------------------------------------------------"
  sudo add-apt-repository ppa:obsproject/obs-studio
  sudo apt update
  sudo apt install ffmpeg obs-studio
}

obsidian() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo -ne "
    --------------------------------------------------
    |              Installing Obsidian               |
    --------------------------------------------------"
    flatpak install flathub md.obsidian.Obsidian

  else
    echo "Abort."
  fi
}

openrgb() {
  echo "
  --------------------------------------------------
  |              Installing OpenRGB                |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.openrgb.OpenRGB

  else
    HEIGHT=400
    WIDTH=800
    TITLE="Choose Your Ubuntu Version"
    PROMPT="Ubuntu Version"
    COLUMN1="Version"
    COLUMN2="Description"
    OPTIONS=(
      20.10\ and\ older "choose this if you're running ubuntu 20.10 and lower"
      21.04\ and\ newer "choose this if you're running ubuntu 21.04 and later"
    )

    opt=$(createMenu)

    case "$opt" in
      20.10\ and\ older)
        clear
        wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_buster_6128731.deb -O ~/Downloads/openrgb-buster.deb
        cd ~/Downloads
        sudo apt install ./openrgb-buster.deb
      ;;

      21.04\ and\ newer)
        clear
        wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_bullseye_6128731.deb -O ~/Downloads/openrgb-bullseye.deb
        cd ~/Downloads
        sudo apt install ./openrgb-bullseye.deb
      ;;

      *)
        chooseOther
        createMenu
      ;;
    esac
  fi
}

pinta() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo "
    --------------------------------------------------
    |                Installing Pinta                |
    --------------------------------------------------"
    flatpak install flathub com.github.PintaProject.Pinta

  else
    echo "Abort."
  fi
}

pulseaudio() {
  echo "
  --------------------------------------------------
  |      Installing pulseaudio and pavucontrol     |
  --------------------------------------------------"
  sudo apt install pulseaudio pavucontrol
}

rambox() {
  echo "
  --------------------------------------------------
  |               Installing Rambox                |
  --------------------------------------------------"
  cd ~/Downloads
  wget -O rambox-2.0.deb 'https://rambox.app/api/download?os=linux&package=deb'
  sudo apt install ./rambox-2.0.deb
}

scrcpy() {
  echo "
  --------------------------------------------------
  |               Installing ScrCpy                |
  --------------------------------------------------"
  sudo apt install scrcpy
}

simplescreenrecorder() {
  echo "
  --------------------------------------------------
  |         Installing simplescreenrecorder        |
  --------------------------------------------------"
  sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
  sudo apt-get update
  sudo apt-get install simplescreenrecorder
}

spotify() {
  echo "
  --------------------------------------------------
  |               Installing Spotify               |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub com.spotify.Client

  else
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    sudo apt-get update && sudo apt-get install spotify-client
  fi
}

telegram() {
  echo "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo "
    --------------------------------------------------
    |         Installing Telegram Desktop            |
    --------------------------------------------------"
    flatpak install flathub org.telegram.desktop

  else
    echo "Abort."
  fi
}

virt-manager() {
  echo "
  --------------------------------------------------
  |       Installing Virtual Machine Manager       |
  --------------------------------------------------"
  virtualization=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
  echo "cpuinfo vm|svmx = $virtualization"

  if [ $virtualization > 0 ]
  then
    echo "You have enabled virtualization on your machine"
    echo "Proceed installing..."
    sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

    echo "Verify that libvirt is running..."
    sudo systemctl status libvirtd.service | grep running

    echo "Setting up network by default and autostart..."
    sudo virsh net-start default
    sudo virsh net-autostart default

    echo "Checking network status..."
    sudo virsh net-list --all

    echo "Adding libvirt user..."
    sudo adduser $(whoami) libvirt
    sudo adduser $(whoami) libvirt-qemu

  elif [ $virtualization = 0 ]
  then
    echo "If the number shows 0, then enable virtualization on bios settings"
    echo "Enable VT-x (Virtualization Technology Extension) for Intel processor"
    echo "Enable AMD-V for AMD processor"

    break
  fi
}

vlc() {
  echo "
  --------------------------------------------------
  |                  Installing VLC                |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? (if no, using snap instead) [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub org.videolan.VLC

  else
    sudo snap install vlc
  fi
}

vscode() {
  echo "
  --------------------------------------------------
  |         Installing Visual Studio Code          |
  --------------------------------------------------"
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt install code
}

whatsapp() {
  echO "This package is only available in flatpak."
  echo -ne "Do you want to continue ? [Y/n] "
  read yesInstall

  if [[ "$yesInstall" = "Y" || "$yesInstall" = "y" || "$yesInstall" = "" ]]
  then
    echo "
    --------------------------------------------------
    |          Installing WhatsApp Desktop           |
    --------------------------------------------------"
    flatpak install flathub io.github.mimbrero.WhatsAppDesktop

  else
    echo "Abort."
  fi
}

wine() {
  echo "
  --------------------------------------------------
  |                 Installing WINE                |
  --------------------------------------------------"
  sudo dpkg --add-architecture i386
  wget -nc https://dl.winehq.org/wine-builds/winehq.key
  sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

  HEIGHT=400
  WIDTH=800
  TITLE="Choose Your Ubuntu Version"
  PROMPT="Ubuntu Version"
  COLUMN1="Version"
  COLUMN2="Description"
  OPTIONS=(
    18.04 "choose this if you're running ubuntu 18.04"
    20.04 "choose this if you're running ubuntu 20.10"
    22.04 "choose this if you're running ubuntu 21.04"
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

ytdlp() {
  echo "
  --------------------------------------------------
  |              Installing yt-dlp                 |
  --------------------------------------------------"
  sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
  sudo chmod a+rx /usr/local/bin/yt-dlp
}

zoom() {
  echo "
  --------------------------------------------------
  |                  Installing Zoom               |
  --------------------------------------------------"
  echo -ne "Do you want to install it with flatpak ? [Y/n] "
  read flatpakOption

  if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
  then
    flatpak install flathub us.zoom.Zoom

  else
    clear
    wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Downloads/zoom_amd64.deb
    cd ~/Downloads
    sudo apt install ./zoom_amd64.deb
  fi
}

installMissingDependecies() {
  echo -ne "\nInstall missing dependencies ? [Y/n] "
  read installMissing

  if [[ "$installMissing" = "Y" || "$installMissing" = "y" || "$installMissing" = "" ]]
  then
    sudo apt --fix-broken install
    sudo apt install -f

  else
    echo "Abort."
  fi
}

removeUnused() {
  echo -ne "\nRemove unnecessary packages ? [Y/n] "
  read removePackage

  if [[ "$removePackage" = "Y" || "$removePackage" = "y" || "$removePackage" = "" ]]
  then
    sudo apt autoremove
    sudo apt autoclean

  else
    echo "Abort."
  fi
}

# export stuff
export -f createMenu
export -f chooseOther
export -f checkFedoraRedhat
export -f checkArch
export -f checkDebian
export -f checkSUSE
export BRed
export Color_Off

# -------------------------------------------------------------------------------------
# sCrIpT sTaRtS
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
    Exit "exit this installing process if you are done" ""
  )

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

# Install missing dependencies
installMissingDependecies

# Remove unused package
removeUnused
