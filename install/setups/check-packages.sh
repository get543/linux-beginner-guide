
packageFedoraRedhat() {
  echo -e "${Green}You are running on fedora or redhat based distros${Color_Off}"
  echo -e "${Green}Checking ${BRed}zenity wget curl ${Green}installed or not.${Color_Off}"

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo -e "${Green}zenity is not installed."
    echo -ne "${DYellow}Install zenity ? [Y/n] ${Color_Off}"
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |             Installing zenity              |
      ---------------------------------------------- ${Color_Off}"
      sudo yum install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo -e "${Green}wget is not installed."
    echo -ne "${DYellow}Install wget ? [Y/n] ${Color_Off}"
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing wget              |
      ---------------------------------------------- ${Color_Off}"
      sudo yum install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo -e "${Green}curl is not installed."
    echo -ne "${DYellow}Install curl ? [Y/n] ${Color_Off}"
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing curl              |
      ---------------------------------------------- ${Color_Off}"
      sudo yum install curl
    else
      echo "Abort."
    fi
  fi
}

packageArch() {
  echo -e "${Green}You are running on arch based distros${Color_Off}"
  echo -e "${Green}Checking ${BRed}zenity wget curl ${Green}installed or not.${Color_Off}"

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo -e "${Green}zenity is not installed."
    echo -ne "${DYellow}Install zenity ? [Y/n] ${Color_Off}"
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |             Installing zenity              |
      ---------------------------------------------- ${Color_Off}"
      sudo pacman -Sy zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo -e "${Green}wget is not installed."
    echo -ne "${DYellow}Install wget ? [Y/n] ${Color_Off}"
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing wget              |
      ---------------------------------------------- ${Color_Off}"
      sudo pacman -Sy wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo -e "${Green}curl is not installed."
    echo -ne "${DYellow}Install curl ? [Y/n] ${Color_Off}"
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing curl              |
      ---------------------------------------------- ${Color_Off}"
      sudo pacman -Sy curl
    else
      echo "Abort."
    fi
  fi
}

packageDebian() {
  echo -e "${Green}You are running on debian based distros${Color_Off}"
  echo -e "${Green}Checking ${BRed}zenity wget curl ${Green}installed or not.${Color_Off}"

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo -e "${Green}zenity is not installed."
    echo -ne "${DYellow}Install zenity ? [Y/n] ${Color_Off}"
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |             Installing zenity              |
      ---------------------------------------------- ${Color_Off}"
      sudo apt install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo -e "${Green}wget is not installed."
    echo -ne "${DYellow}Install wget ? [Y/n] ${Color_Off}"
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing wget              |
      ---------------------------------------------- ${Color_Off}"
      sudo apt install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo -e "${Green}curl is not installed."
    echo -ne "${DYellow}Install curl ? [Y/n] ${Color_Off}"
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing curl              |
      ---------------------------------------------- ${Color_Off}"
      sudo apt install curl
    else
      echo "Abort."
    fi
  fi
}

packageSUSE() {
  echo -e "${Green}You are running on OpenSUSE distros${Color_Off}"
  echo -e "${Green}Checking ${BRed}zenity wget curl ${Green}installed or not.${Color_Off}"

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo -e "${Green}zenity is not installed."
    echo -ne "${DYellow}Install zenity ? [Y/n] ${Color_Off}"
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |             Installing zenity              |
      ---------------------------------------------- ${Color_Off}"
      sudo zypper install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo -e "${Green}wget is not installed."
    echo -ne "${DYellow}Install wget ? [Y/n] ${Color_Off}"
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing wget              |
      ---------------------------------------------- ${Color_Off}"
      sudo zypper install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo -e "${Green}curl is not installed."
    echo -ne "${DYellow}Install curl ? [Y/n] ${Color_Off}"
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo -e "${DMagenta}
      ----------------------------------------------
      |               Installing curl              |
      ---------------------------------------------- ${Color_Off}"
      sudo zypper install curl
    else
      echo "Abort."
    fi
  fi
}

otherDistros() {
  echo "Sorry I don't make the script for your distro."
  echo "But you can install it using your distro's package manager."
  echo -e "Example for ${BRed}debian${Color_Off} : ${BRed}sudo apt install zenity wget curl ${Color_Off}"
  echo -e "Example for ${BRed}arch${Color_Off} : ${BRed}sudo pacman -Sy install zenity wget curl ${Color_Off}"

  if ! command -v zenity &> /dev/null
  then
    echo -e "${BRed}\nZenity is not installed.${Color_Off}"
    echo "You have to install it to run the script."
  fi

  if ! command -v wget &> /dev/null
  then
    echo -e "${BRed}\nWget is not installed.${Color_Off}"
    echo "You have to install it for autoinstall app."
  fi

  if ! command -v curl &> /dev/null
  then
    echo -e "${BRed}\ncURL is not installed.${Color_Off}"
    echo "You have to install it for autoinstall app."
  fi
}

# Check OS
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

# DEBIAN
if [ "$debian" ]
then
  packageDebian

# FEDORA/REDHAT
elif [ "$fedoraRedhat" ]
then
  packageFedoraRedhat

# ARCH
elif [ "$arch" ]
then
  packageArch

# OPENSUSE
elif [ "$opensuse" ]
then
  packageSUSE

else
  otherDistros

  echo -ne "\n${Green}I suggest to stop here and install the require package first.${Color_Off}\n"
  exit
fi

echo -ne "\n${BRed}zenity wget curl ${Green}is installed.\n${Color_Off}"

# FLATPAK
echo -ne "\n${Green}Checking ${BRed}flatpak ${Green}installed or not.\n${Color_Off}"

if ! command -v flatpak &> /dev/null
then
  ./setups/flatpak-install.sh
else
  echo -e "${BRed}flatpak ${Green}is installed.${Color_Off}"
fi
