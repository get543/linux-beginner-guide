# distro functions
ubuntu/debian() {
  echo "Installing cURL. "
  sudo apt install curl
}

opensuse() {
  echo "Installing cURL. "
  sudo zypper install curl
}

fedora/redhat() {
  echo "Installing cURL. "

  echo "\nChoose 'Y' = Install using dnf"
  echo "Choose 'n' = Install using yum"
  echo -ne "You want to install it now ? [Y/n] "
  read yumordnf

  if [[ "$yumordnf" = "Y" || "$yumordnf" = "y" || "$yumordnf" = "" ]]
  then
    sudo dnf install curl
  else
    sudo yum install curl
  fi
}

arch() {
  echo "Installing cURL. "
  sudo pacman -Sy curl
}

# ----------------------------------------------------------------------------------

# Installing curl
echo "It looks like curl is NOT installed!"
echo -ne "You want to install it now ? [Y/n] "
read curlOption

if [[ "$curlOption" = "Y" || "$curlOption" = "y" || "$curlOption" = "" ]]
then
  HEIGHT=25
  WIDTH=100
  CHOICE_HEIGHT=20
  BACKTITLE="Package Install"
  TITLE="cURL Installation"
  MENU="Choose Your Distribution :"

  OPTIONS=(
    Ubuntu/Debian "A Distro"
    Fedora/Red\ Hat "A Distro"
    OpenSUSE "A Distro"
    Arch "A Distro"

    Cancel "exit this process"
  )

  # menu
  createMenu

  clear

  # Case
  case $CHOICE in
    Ubuntu/Debian) ubuntu/debian ;;
    
    Fedora/Red\ Hat) fedora/redhat ;;

    OpenSUSE) opensuse ;;

    Arch) arch ;;

    Cancel) echo "Done." ;;
  esac
else
  echo "Abort."
fi