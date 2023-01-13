#! /usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
      # replace apt for nala
      apt() {
        command nala "$@"
      }

      sudo() {
        if [ "$1" = "apt" ]
        then
          shift
          command sudo nala "$@"
        else
          command sudo "$@"
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
        "${OPTIONS[@]}"
}

# question dialog
questionDialog() {
  zenity --question \
        --text="$QUESTION" \
        --ok-label=$OKLABEL \
        --cancel-label=$CANCELLABEL \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --window-icon="$SCRIPT_DIR/icons/peepoThink.png"
}

# choose no option
chooseOther() {
  zenity --notification \
        --text="Invalid option. You didn't choose any of the options." \
        --window-icon="$SCRIPT_DIR/icons/error.png"
}

installMissingDependecies() {
  QUESTION="Install missing dependencies ?"
  WIDTH="600"
  HEIGHT="200"
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
  WIDTH="600"
  HEIGHT="200"
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
export -f questionDialog
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
  HEIGHT=900
  WIDTH=1000
  TITLE="AutoInstall"
  PROMPT="Choose What App You Want To Install"
  COLUMN1="Apps"
  COLUMN2="Description"
  COLUMN3="Flatpak Support"
  OPTIONS=(
    Ao "an unofficial, third-party, Microsoft To-Do desktop app" "NO"
    Audacity "record and edit audio files" "YES"
    Autokey "control os with python script and keyboard shortcut" "NO"
    balena-etcher "flash OS images to SD cards and USB drives, safely and easily" "NO"
    dconf\ Editor "customise gnome deeply, like registry editor on windows" "NO"
    Deckboard "turn your phone into a streamdeck" "NO"
    Discord "all-in-one voice and text chat for gamers" "YES"
    Droidcam "use your phone as a webcam" "NO"
    Fragments "download and share files using the BitTorrent protocol" "YES"
    Geary "send and receive email (email client)" "NO"
    Git "to access git repository" "NO"
    GNU\ Image\ Manipulation\ Program\ \(GIMP\) "create images and edit photographs" "YES"
    Gnome\ Encfs\ Manager "a manager and mounter for encfs stashes (encrypt folders)" "NO"
    Gnome\ Tweaks "tweak advanced gnome 3 settings" "NO"
    Indicator-Sound-Switcher "sound input and output selector indicator" "NO"
    Inkscape "create and edits Scalable Vector Graphics (SVG) images" "YES"
    Kdenlive "video editing program by KDE" "YES"
    KolourPaint "an easy-to-use paint program" "YES"
    Krita "digital painting, creative freedom" "YES"
    Obsidian "application for taking notes based on markdown file" "YES"
    OBS\ Studio "live streaming and video recording software" "YES"
    OpenRGB "control rgb lighting of your peripherals" "NO"
    Pinta "edit images and paint digitally" "YES"
    pulseaudio\ and\ pavucontrol "sound server and to adjust the volume level" "NO"
    Rambox "an all-in-one messenger that lets you combine multiple services in one place" "NO"
    ScrCpy "display and control Android devices connected via USB" "NO"
    simplescreenrecorder "a feature rich screen recorder that supports X11 and OpenGL" "NO"
    Spotify "online music streaming service" "YES"
    starship "minimal, blazing-fast, and infinitely customizable prompt for any shell" "No"
    Telegram\ Desktop "official desktop version of Telegram messaging app" "YES"
    Visual\ Studio\ Code "code editor" "NO"
    Virtual\ Machine\ Manager "virtual machine (VM) based on QEMU" "NO"
    VLC "VLC media player, the open-source multimedia player" "YES"
    WhatsApp\ Desktop "an unofficial WhatsApp client for Linux, built with Electron" "YES"
    WINE "a compatibility layer to run windows applications on linux" "NO"
    yt-dlp "download youtube videos" "NO"
    Zoom "zoom video conference" "YES"
    "" "" ""
    Exit "exit this installing process if you are done :)" "-"
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

    Droidcam) "$SCRIPT_DIR"/droidcam.sh ;;

    Fragments) fragments ;;

    Geary) geary ;;

    GNU\ Image\ Manipulation\ Program\ \(GIMP\)) gimp ;;

    Git) git ;;

    Gnome\ Encfs\ Manager) encfs ;;

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

    starship) starship ;;

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
