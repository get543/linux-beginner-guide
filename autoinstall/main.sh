#! /usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

BRed="\033[1;31m"
Color_Off="\033[0m"

DMagenta="\033[35m"
DYellow="\033[33m"
Green="\033[92m"

chmod u+x "$SCRIPT_DIR"/setups/*.sh
chmod u+x "$SCRIPT_DIR"/updates/*.sh
chmod u+x "$SCRIPT_DIR"/apps/*.sh
chmod u+x "$SCRIPT_DIR"/*.sh

source "$SCRIPT_DIR/apps/app-functions.sh"
source "$SCRIPT_DIR/apps/template.sh"

# sudo gui prompt
sudo() {
  /usr/bin/pkexec --disable-internal-agent /usr/bin/sudo "$@"
}

# load node version manager
loadNvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
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

# check nala
checkNala() {
  checkDebian

  if [ "$debian" ]
  then
    if ( ! command -v nala &> /dev/null )
    then
      echo -e "\n${BRed}nala ${Green}is ${BRed}not ${Green}installed. Using ${BRed}apt ${Green}instead.${Color_Off}\n"
    else
      sudo() {
        if [ "$1" = "apt" ]
        then
          # using nala but with sudo gui prompt
          shift
          command /usr/bin/pkexec --disable-internal-agent /usr/bin/sudo nala "$@"
        else
          # keep apt but with sudo gui prompt
          command /usr/bin/pkexec --disable-internal-agent /usr/bin/sudo "$@"
        fi
      }
    fi
  fi
}

# menu dialog
createMenu() {
  zenity --title="$TITLE" \
        --text="$PROMPT" \
        --list \
        --column="$COLUMN1" \
        --column="$COLUMN2" \
        --column="$COLUMN3" \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --window-icon="$SCRIPT_DIR/icons/list.png" \
        "${OPTIONS[@]}"
}

# question dialog
questionDialog() {
  zenity --question \
        --text="$QUESTION" \
        --ok-label="$OKLABEL" \
        --cancel-label="$CANCELLABEL" \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --window-icon="$SCRIPT_DIR/icons/peepoThink.png"
}

# checklist menu
checklistMenu() {
  zenity --list \
        --checklist \
        --height="$HEIGHT" \
        --width="$WIDTH" \
        --column="$COLUMN1" \
        --column="$COLUMN2" \
        --column="$COLUMN3" \
        --window-icon="$SCRIPT_DIR/icons/list.png" \
        ${appList}
}

# choose no option
chooseOther() {
  zenity --notification \
        --text="Invalid option. You didn't choose any of the options." \
        --window-icon="$SCRIPT_DIR/icons/error.png"
}

installMissingDependecies() {
  QUESTION="Install missing dependencies ?"
  WIDTH=600
  HEIGHT=200
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0) # yes
      echo -e "\n${DMagenta}============= Fixing Broken Packages =============${Color_Off}"

      if [ "$debian" ]
      then
        sudo apt install --fix-broken

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
        echo -ne "Enter to continue... "
        read
      fi
    ;;

    1) # no
      echo "Abort."
    ;;

    *)
      chooseOther
      installMissingDependecies
    ;;
  esac
}

removeUnused() {
  QUESTION="Remove unnecessary packages ?"
  WIDTH=600
  HEIGHT=200
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0) # yes
      echo -e "\n${DMagenta}============= Remove Unused Packages =============${Color_Off}"

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
	      sudo pacman -Scc

      elif [ "$opensuse" ]
      then
        echo -e "${Green}Sorry I don't know how to do that on OpenSUSE${Color_Off}"

      else
        echo -e "${Green}I'm sorry you're probably running distro other than.."
        echo -e "fedora/redhat, arch, debian/ubuntu, opensuse${Color_Off}"
        echo -e "working for other distro as well."
        echo -ne "Enter to continue... "
        read
      fi
    ;;

    1) # no
      echo "Abort."
    ;;

    *)
      chooseOther
      removeUnused
    ;;
  esac
}

# export variables & functions
export -f sudo
export -f loadNvm
export -f createMenu
export -f questionDialog
export -f checklistMenu
export -f chooseOther
export -f checkFedoraRedhat
export -f checkArch
export -f checkDebian
export -f checkSUSE
export -f checkNala
export SCRIPT_DIR
export BRed
export Color_Off
export DMagenta
export DYellow
export Green

# -------------------------------------------------------------------------------------
#                                 SCRIPT STARTS
# -------------------------------------------------------------------------------------

# checking package
"$SCRIPT_DIR"/setups/check-packages.sh

# update system
"$SCRIPT_DIR"/updates/update.sh
"$SCRIPT_DIR"/updates/upgrade.sh

while :
do
  HEIGHT=800
  WIDTH=1200
  TITLE="AutoInstall"
  PROMPT="Choose What App You Want To Install"
  COLUMN1="Apps"
  COLUMN2="Description"
  COLUMN3="Flatpak Support"
  OPTIONS=(
    Exit "exit this installing process if you are done :)" "-"
    "" "" ""
    Ao "an unofficial, third-party, Microsoft To-Do desktop app" "NO"
    Audacity "record and edit audio files" "YES"
    Autokey "control os with python script and keyboard shortcut" "NO"
    balena-etcher "flash OS images to SD cards and USB drives, safely and easily" "NO"
    dconf\ Editor "customise gnome deeply, like registry editor on windows" "NO"
    Deckboard "turn your phone into a streamdeck" "NO"
    Discord "all-in-one voice and text chat for gamers" "YES"
    Docker "a self-sufficient runtime for containers" "NO"
    Droidcam "use your phone as a webcam" "NO"
    Fragments "download and share files using the BitTorrent protocol" "YES"
    Geary "send and receive email (email client)" "NO"
    Git "to access git repository" "NO"
    GNU\ Image\ Manipulation\ Program\ \(GIMP\) "create images and edit photographs" "YES"
    Gnome\ Encfs\ Manager "a manager and mounter for encfs stashes (encrypt folders)" "NO"
    Gnome\ Tweaks "tweak advanced gnome 3 settings" "NO"
    Google\ Cloud\ CLI "the gcloud CLI includes the gcloud, gsutil and bq command-line tools." "NO"
    Indicator-Sound-Switcher "sound input and output selector indicator" "NO"
    Inkscape "create and edits Scalable Vector Graphics (SVG) images" "YES"
    Joplin "an open source note taking and to-do application with synchronisation capabilities." "NO"
    Kdenlive "video editing program by KDE" "YES"
    KolourPaint "an easy-to-use paint program" "YES"
    Krita "digital painting, creative freedom" "YES"
    lazygit "a simple terminal UI for git commands." "NO"
    Obsidian "application for taking notes based on markdown file" "YES"
    OBS\ Studio "live streaming and video recording software" "YES"
    OpenRGB "control rgb lighting of your peripherals" "NO"
    PhoneInfoga "PhoneInfoga is one of the most advanced tools to scan international phone numbers" "NO"
    Pinta "edit images and paint digitally" "YES"
    pulseaudio\ and\ pavucontrol "sound server and to adjust the volume level" "NO"
    Rambox "an all-in-one messenger that lets you combine multiple services in one place" "NO"
    Safing\'s\ Portmaster "see all connection on your system and block them" "NO"
    ScrCpy "display and control Android devices connected via USB" "NO"
    simplescreenrecorder "a feature rich screen recorder that supports X11 and OpenGL" "NO"
    Spotify "online music streaming service" "YES"
    starship "minimal, blazing-fast, and infinitely customizable prompt for any shell" "NO"
    Telegram\ Desktop "official desktop version of Telegram messaging app" "YES"
    Universal\ Android\ Debloater\ GUI "GUI to debloat non-rooted android devices using ADB" "NO"
    Ventoy "ventoy is an open source tool to create bootable USB drive for ISO/WIM/IMG/VHD(x)/EFI files" "NO"
    Visual\ Studio\ Code "code editor" "NO"
    Virtual\ Machine\ Manager "virtual machine (VM) based on QEMU" "NO"
    VLC "VLC media player, the open-source multimedia player" "YES"
    WhatsApp\ Desktop "an unofficial WhatsApp client for Linux, built with Electron" "YES"
    WINE "a compatibility layer to run windows applications on linux" "NO"
    yt-dlp "download youtube videos" "NO"
    Zoom "zoom video conference" "YES"
  )

  # check
  checkArch
  checkDebian
  checkFedoraRedhat
  checkSUSE
  checkNala

  clear

  # menu
  option=$(createMenu)

  # case
  case "$option" in
    Exit)
      echo "Done."
      break
    ;;

    Ao) ao ;;

    Audacity) audacity ;;

    Autokey) autokey ;;

    balena-etcher) balena-etcher ;;

    dconf\ Editor) dconf-editor ;;

    Deckboard) deckboard ;;

    Discord) discord ;;

    Docker) docker ;;

    Droidcam) "$SCRIPT_DIR"/droidcam.sh ;;

    Fragments) fragments ;;

    Geary) geary ;;

    GNU\ Image\ Manipulation\ Program\ \(GIMP\)) gimp ;;

    Git) git ;;

    Gnome\ Encfs\ Manager) encfs ;;

    Gnome\ Tweaks) gnome-tweaks ;;

    Google\ Cloud\ CLI) gcloudcli ;;

    Indicator-Sound-Switcher) indicator-sound-switcher ;;

    Inkscape) inkscape ;;

    Joplin) joplin ;;

    Kdenlive) kdenlive ;;

    KolourPaint) kolourpaint ;;

    Krita) krita ;;

    lazygit) lazygit ;;

    OBS\ Studio) obs-studio ;;

    Obsidian) obsidian ;;

    OpenRGB) openrgb ;;

    PhoneInfoga) phoneinfoga ;;

    Pinta) pinta ;;

    pulseaudio\ and\ pavucontrol) pulseaudio ;;

    Rambox) rambox ;;

    Safing\'s\ Portmaster) portmaster ;;

    ScrCpy) scrcpy ;;

    simplescreenrecorder) simplescreenrecorder ;;

    Spotify) spotify ;;

    starship) starship ;;

    Telegram\ Desktop) telegram ;;

    Universal\ Android\ Debloater\ GUI) universal-android-debloater ;;

    Ventoy) ventoy ;;

    Virtual\ Machine\ Manager) virt-manager ;;

    VLC) vlc ;;

    Visual\ Studio\ Code) vscode ;;

    WhatsApp\ Desktop) whatsapp ;;

    WINE) wine ;;

    yt-dlp) ytdlp ;;

    Zoom) zoom ;;

    *) chooseOther ;;
  esac
done

# install missing dependencies
installMissingDependecies

# remove unused package
removeUnused
