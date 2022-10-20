# distro functions
ubuntu() {
  echo "Installing Flatpak. "
  sudo add-apt-repository ppa:flatpak/stable
  sudo apt update
  sudo apt install flatpak

  echo "Installing the gnome software plugin for flatpak. "
  sudo apt install gnome-software-plugin-flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

fedora() {
  echo "Flatpak is installed by default on Fedora Workstation, Fedora Silverblue, and Fedora Kinoite. "
  echo "Adding flathub repository. "

  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

arch() {
  echo "Installing Flatpak. "
  sudo pacman -S flatpak
}

debian() {
  echo "Installig Flatpak. "
  apt install flatpak

  echo "Installing the gnome software plugin for flatpak. "
  apt install gnome-software-plugin-flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

redhat() {
  echo "Installing Flatpak. "
  sudo yum install flatpak

  echo "Download and install this flathub repository. "
  echo "https://flathub.org/repo/flathub.flatpakrepo "
}

endavouros() {
  echo "Installing Flatpak. "
  sudo pacman -Syu
  sudo pacman -S flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

opensuse() {
  sudo zypper install flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

gentoo() {
  echo "Enabling the ~amd64 keyword for sys-apps/flatpak, acct-user/flatpak and acct-group/flatpak. "
  echo -e 'sys-apps/flatpak ~amd64\nacct-user/flatpak ~amd64\nacct-group/flatpak ~amd64\ndev-util/ostree ~amd64' >> /etc/portage/package.accept_keywords/flatpak
  
  echo "Installing Flatpak. "
  emerge sys-apps/flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

kubuntu() {
  echo "Installing Flatpak. "
  sudo add-apt-repository ppa:alexlarsson/flatpak
  sudo apt update
  sudo apt install flatpak

  echo "Install the Discover Flatpak backend for Kubuntu 20.04 or later. "
  sudo apt install plasma-discover-backend-flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

solus() {
  echo "Installing Flatpak. "
  sudo eopkg install flatpak xdg-desktop-portal-gtk

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

alpine() {
  echo "Installing Flatpak. "
  sudo apk add flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

mageia() {
  echo "Flatpak is available for Mageia 6 and newer. "

  echo "\nIf want to install Flatpak using DNF, you can choose 'Y'. "
  echo "But If you want to install Flatpak usin urpmi, you can choose 'N'"
  echo -ne "You want to install it now ? [Y/n] "
  read mageiaInstallOption

  if [[ "$mageiaInstallOption" = "Y" || "$mageiaInstallOption" = "y" || "$mageiaInstallOption" = "" ]]
  then
    echo "Installing Flatpak using DNF. "
    dnf install flatpak
  else
    echo "Installing Flatpak using urpmi. "
    urpmi flatpak
  fi

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

popos() {
  echo "Pop!_OS 20.04 has Flatpak installed and Flathub configured by default. "
  echo "The Pop!_Shop can be used to install flatpaks. "

  echo "\nBut if you're running on Pop!_OS 19.10 and earlier, you can continue the installation. "
  echo -ne "You want to install it now ? [Y/n] "
  read poposInstallFlatpak

  if [[ "$poposInstallFlatpak" = "Y" || "$poposInstallFlatpak" = "y" || "$poposInstallFlatpak" = "" ]]
  then
    echo "Installing Flatpak. "
    sudo apt install flatpak

    echo "Adding flathub repository. "
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Abort."
  fi
}

raspberrypios() {
  echo "Flatpak only supported for 64-bit version"
  echo "Installing Flatpak. " 
  apt install flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

clearlinux() {
  echo "Flatpak is installed and Flathub repository is pre-configured by default on Clear Linux. "
  sudo swupd bundle-add desktop
}

voidlinux() {
  echo "Installing Flatpak. "
  sudo xbps-install -S flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

sulinos() {
  echo "Installing Flatpak. "
  su
  inary it flatpak

  echo "Adding flathub repository. "
  su
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

ataraxialinux() {
  echo "Installing Flatpak. "
  sudo neko em flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

deepin() {
  echo "Installing Flatpak. "
  sudo apt install flatpak

  echo "Adding flathub repository. "
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  echo "Installing Deeping themes. "
  flatpak install flathub org.gtk.Gtk3theme.deepin
  flatpak install flathub org.gtk.Gtk3theme.deepin-dark
}

pardus() {
  echo "Flatpak is available in Pardus 2019 and newer. \n"

  echo "If you're running on Pardus 2017 and older versions, flatpak is available in the official backports repository. "
  echo "https://backports.debian.org/Instructions/"

  echo "\nIf you're running on Pardus 2019 and newer, you can continue the installation. "
  echo -ne "You want to install it now ? [Y/n] "
  read pardusInstallFlatpak

  if [[ "$pardusInstallFlatpak" = "Y" || "$pardusInstallFlatpak" = "y" || "$pardusInstallFlatpak" = "" ]]
  then
    echo "Installing Flatpak. "
    apt install flatpak

    echo "Installing flathub repository. "
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo "\nIf you're running GNOME, it is also a good idea to install the Flatpak plugin for GNOME Software. "
    echo -ne "You want to install it now ? [Y/n] "
    read pardusGnomePlugin

    if [[ "$pardusGnomePlugin" = "Y" || "$pardusGnomePlugin" = "y" || "$pardusGnomePlugin" = "" ]]
    then
      apt install gnome-software-plugin-flatpak
    else
      echo "Abort. "
    fi
  else
    echo "Abort."
  fi
}

pisilinux() {
  echo "Flatpak is available in Pisi 2.1 and newer. "

  echo "\nIf you're running on Pisi 2.1 and newer, you can continue the installation. "
  echo -ne "You want to install it now ? [Y/n] "
  read pisilinuxFlatpak

  if [[ "$pisilinuxFlatpak" = "Y" || "$pisilinuxFlatpak" = "y" || "$pisilinuxFlatpak" = "" ]]
  then
    echo "Installing Flatpak. "
    sudo pisi it flatpak

    echo "Adding flathub repository. "
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Abort. "
  fi  
}

# ----------------------------------------------------------------------------------

# Installing flatpak
echo "It looks like flatpak is NOT installed!"
echo -ne "You want to install it now ? [Y/n] "
read flatpakOption

if [[ "$flatpakOption" = "Y" || "$flatpakOption" = "y" || "$flatpakOption" = "" ]]
then
  HEIGHT=25
  WIDTH=100
  CHOICE_HEIGHT=20
  BACKTITLE="Package Install"
  TITLE="Flatpak Installation"
  MENU="Choose Your Distribution :"

  OPTIONS=(
    Ubuntu "A Distro"
    Fedora "A Distro"
    Arch "A Distro"
    Debian "A Distro"
    Red\ Hat\ Enterprise\ Linux "A Distro"
    EndavourOS "A Distro"
    openSUSE "A Distro"
    Gentoo "A Distro"
    Kubuntu "A Distro"
    Solus "A Distro"
    Alpine "A Distro"
    Mageia "A Distro"
    Pop\!_OS "A Distro"
    Raspberry\ Pi\ OS "A Distro"
    Clear\ Linux "A Distro"
    Void\ Linux "A Distro"
    SulinOS "A Distro"
    Ataraxia\ Linux "A Distro"
    Deepin "A Distro"
    Pardus "A Distro"
    Pisi\ GNU\ Linux "A Distro"

    Cancel "exit this process"
  )

  # menu
  createMenu

  clear

  # case
  case $CHOICE in
    Ubuntu) ubuntu ;;

    Fedora) fedora ;;

    Arch) arch ;;

    Debian) debian ;;

    Red\ Hat\ Enterprise\ Linux) redhat ;;

    EndavourOS) endavouros ;;

    openSUSE) opensuse ;;

    Gentoo) gentoo ;;

    Kubuntu) kubuntu ;;

    Solus) solus ;;

    Alpine) alpine ;;

    Mageia) mageia ;;

    Pop\!_OS) popos ;;

    Raspberry\ Pi\ OS) raspberrypios ;;

    Clear\ Linux) clearlinux ;;

    Void\ Linux) voidlinux ;;

    SulinOS) sulinos ;;

    Ataraxia\ Linux) ataraxialinux ;;

    Deepin) deepin ;;

    Pardus) pardus ;;

    Pisi\ GNU\ Linux) pisilinux ;;

    Cancel) echo "Done." ;;
  esac
else
  echo "Abort."
fi