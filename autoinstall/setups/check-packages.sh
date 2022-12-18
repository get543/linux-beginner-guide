template() {
  echo -e "${Green}You are running on $DISTRO based distros${Color_Off}"
  echo -e "${Green}Checking ${BRed}zenity wget curl ${Green}installed or not.${Color_Off}"

  # Checking zenity
  if ( ! command -v zenity &> /dev/null )
  then
    echo -e "${Green}\nzenity is not installed."
    echo -ne "${DYellow}Install zenity ? [Y/n] ${Color_Off}"
    read zenityOption

    case "$zenityOption" in
      "Y"|"y"|"")
        echo -e "${DMagenta}
        ----------------------------------------------
        |             Installing zenity              |
        ---------------------------------------------- ${Color_Off}"
        $ZENITY_COMMAND
      ;;

      *) echo "Abort" ;;
    esac
  fi

  # Checking wget
  if ( ! command -v wget &> /dev/null )
  then
    echo -e "${Green}\nwget is not installed."
    echo -ne "${DYellow}Install wget ? [Y/n] ${Color_Off}"
    read wgetOption

    case "$wgetOption" in
      "Y"|"y"|"")
        echo -e "${DMagenta}
        ----------------------------------------------
        |               Installing wget              |
        ---------------------------------------------- ${Color_Off}"
        $WGET_COMMAND
      ;;

      *) echo "Abort" ;;
    esac
  fi

  # Checking curl
  if ( ! command -v curl &> /dev/null )
  then
    echo -e "${Green}\ncurl is not installed."
    echo -ne "${DYellow}Install curl ? [Y/n] ${Color_Off}"
    read curlOption

    case "$curlOption" in
      "Y"|"y"|"")
        echo -e "${DMagenta}
        ----------------------------------------------
        |               Installing curl              |
        ---------------------------------------------- ${Color_Off}"
        $CURL_COMMAND
      ;;

      *) echo "Abort" ;;
    esac
  fi
}

packageDebian() {
  DISTRO="Debian"
  ZENITY_COMMAND="sudo apt install zenity"
  WGET_COMMAND="sudo apt install wget"
  CURL_COMMAND="sudo apt install curl"

  template
}

packageFedoraRedhat() {
  DISTRO="fedora or redhat"
  ZENITY_COMMAND="sudo yum install zenity"
  WGET_COMMAND="sudo yum install wget"
  CURL_COMMAND="sudo yum install curl"

  template
}

packageArch() {
  DISTRO="arch"
  ZENITY_COMMAND="sudo pacman -Sy zenity"
  WGET_COMMAND="sudo pacman -Sy wget"
  CURL_COMMAND="sudo pacman -Sy curl"

  template
}

packageSUSE() {
  DISTRO="OpenSUSE"
  ZENITY_COMMAND="sudo zypper install zenity"
  WGET_COMMAND="sudo zypper install wget"
  CURL_COMMAND="sudo zypper install curl"

  template
}

otherDistros() {
  echo "Sorry I don't make the script for your distro."
  echo "But you can install it using your distro's package manager."
  echo -e "Example for ${BRed}debian${Color_Off} : ${BRed}sudo apt install zenity wget curl ${Color_Off}"
  echo -e "Example for ${BRed}arch${Color_Off} : ${BRed}sudo pacman -Sy install zenity wget curl ${Color_Off}"
  echo -ne "\n${Green}I suggest to stop here and install the require package first ${BRed}(zenity wget curl)${Color_Off}\n"

  if ( ! command -v zenity &> /dev/null )
  then
    echo -e "${BRed}\nZenity is not installed.${Color_Off}"
    echo "You have to install it to run the script."
  fi

  if ( ! command -v wget &> /dev/null )
  then
    echo -e "${BRed}\nWget is not installed.${Color_Off}"
    echo "You have to install it for autoinstall app."
  fi

  if ( ! command -v curl &> /dev/null )
  then
    echo -e "${BRed}\ncURL is not installed.${Color_Off}"
    echo "You have to install it for autoinstall app."
  fi
}


# ----------------------------------------------
# CHECK
checkNala
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

if [ "$debian" ]
then
  packageDebian

elif [ "$fedoraRedhat" ]
then
  packageFedoraRedhat

elif [ "$arch" ]
then
  packageArch

elif [ "$opensuse" ]
then
  packageSUSE

else
  otherDistros
  exit
fi

echo -ne "\n${BRed}zenity wget curl ${Green}is installed.\n${Color_Off}"

# FLATPAK
echo -ne "\n${Green}Checking ${BRed}flatpak ${Green}installed or not.\n${Color_Off}"

if ( ! command -v flatpak &> /dev/null )
then
  "$SCRIPT_DIR"/setups/flatpak-install.sh
else
  echo -e "${BRed}flatpak ${Green}is installed.${Color_Off}"
fi
