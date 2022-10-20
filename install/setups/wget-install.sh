# Distro functions
ubuntu/debian() {
  echo "Installing Wget. "
  sudo apt install wget
}

redhat() {
  echo "Installing Wget. "
  sudo yum install wget
}

opensuse() {
  echo "Installing Wget. "
  sudo zypper install wget
}

arch() {
  echo "Installing Wget. "
  sudo pacman -Sy wget
}

# ----------------------------------------------------------------------------------

# Installing wget
echo "It looks like wget is NOT installed!"
echo -ne "You want to install it now ? [Y/n] "
read wgetOption

if [[ "$wgetOption" = "Y" || "$wgetOption" = "y" || "$wgetOption" = "" ]]
then
  HEIGHT=25
  WIDTH=100
  CHOICE_HEIGHT=20
  BACKTITLE="Package Install"
  TITLE="Wget Installation"
  MENU="Choose Your Distribution :"

  OPTIONS=(
    Ubuntu/Debian "A Distro"
    Red\ Hat\ Enterprise\ Linux/CentOS/Fedora "A Distro"
    OpenSUSE "A Distro"
    Arch "A Distro"

    Cancel "exit this process"
  )

  # Menu
  createMenu

  clear

  # Case
  case $CHOICE in
    Ubuntu/Debian) ubuntu/debian ;;

    Red\ Hat\ Enterprise\ Linux/CentOS/Fedora) redhat ;;
    
    OpenSUSE) opensuse ;;
    
    Arch) arch ;;

    Cancel) echo "Done." ;;
  esac
else
  echo "Abort."
fi