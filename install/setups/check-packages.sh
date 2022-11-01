
packageFedoraRedhat() {
  echo "You are running on fedora or redhat based distros"
  echo -e "Checking ${BRed}zenity wget curl${Color_Off} installed or not."

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo "zenity is not installed."
    echo -ne "Install zenity ? [Y/n] "
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |             Installing zenity              |
      ----------------------------------------------"
      sudo yum install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo "wget is not installed."
    echo -ne "Install wget ? [Y/n] "
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing wget              |
      ----------------------------------------------"
      sudo yum install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo "curl is not installed."
    echo -ne "Install curl ? [Y/n] "
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing curl              |
      ----------------------------------------------"
      sudo yum install curl
    else
      echo "Abort."
    fi
  fi
}

packageArch() {
  echo "You are running on arch based distros"
  echo -e "Checking ${BRed}zenity wget curl${Color_Off} installed or not."

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo "zenity is not installed."
    echo -ne "Install zenity ? [Y/n] "
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |             Installing zenity              |
      ----------------------------------------------"
      sudo pacman -Sy zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo "wget is not installed."
    echo -ne "Install wget ? [Y/n] "
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing wget              |
      ----------------------------------------------"
      sudo pacman -Sy wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo "curl is not installed."
    echo -ne "Install curl ? [Y/n] "
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing curl              |
      ----------------------------------------------"
      sudo pacman -Sy curl
    else
      echo "Abort."
    fi
  fi
}

packageDebian() {
  echo "You are running on debian based distros"
  echo -e "Checking ${BRed}zenity wget curl${Color_Off} installed or not."

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo "zenity is not installed."
    echo -ne "Install zenity ? [Y/n] "
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |             Installing zenity              |
      ----------------------------------------------"
      sudo apt install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo "wget is not installed."
    echo -ne "Install wget ? [Y/n] "
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing wget              |
      ----------------------------------------------"
      sudo apt install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo "curl is not installed."
    echo -ne "Install curl ? [Y/n] "
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing curl              |
      ----------------------------------------------"
      sudo apt install curl
    else
      echo "Abort."
    fi
  fi
}

packageSUSE() {
  echo "You are running on OPENSUSE distros"
  echo -e "Checking ${BRed}zenity wget curl${Color_Off} installed or not."

  # Checking zenity
  if ! command -v zenity &> /dev/null
  then
    echo "zenity is not installed."
    echo -ne "Install zenity ? [Y/n] "
    read zenityOption

    if [[ "$zenityOption" = "Y" || "$zenityOption" = "y" || "$zenityOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |             Installing zenity              |
      ----------------------------------------------"
      sudo zypper install zenity
    else
      echo "Abort."
    fi
  fi

  # Checking wget
  if ! command -v wget &> /dev/null
  then
    echo "wget is not installed."
    echo -ne "Install wget ? [Y/n] "
    read wgetOption

    if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing wget              |
      ----------------------------------------------"
      sudo zypper install wget
    else
      echo "Abort."
    fi
  fi

  # Checking curl
  if ! command -v curl &> /dev/null
  then
    echo "curl is not installed."
    echo -ne "Install curl ? [Y/n] "
    read curlOption

    if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
    then
      echo "
      ----------------------------------------------
      |               Installing curl              |
      ----------------------------------------------"
      sudo zypper install curl
    else
      echo "Abort."
    fi
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
fi

# FEDORA/REDHAT
if [ "$fedoraRedhat" ]
then
  packageFedoraRedhat
fi

# ARCH
if [ "$arch" ]
then
  packageArch
fi

# OPENSUSE
if [ "$opensuse" ]
then
  packageSUSE
fi

echo -ne "\n${BRed}zenity wget curl${Color_Off} is installed.\n"

# FLATPAK
echo -ne "\nChecking flatpak installed or not.\n"

if ! command -v flatpak &> /dev/null
then
  ./setups/flatpak-install.sh
else
  echo "flatpak is installed."
fi

