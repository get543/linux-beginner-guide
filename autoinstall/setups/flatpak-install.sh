#! /usr/bin/env bash

# menu function
createMenu() {
  zenity --list \
        --title="$TITLE" \
        --text="$PROMPT" \
        --column="$COLUMN1" \
        --column="$COLUMN2" \
        --column="$COLUMN3" \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        "${OPTIONS[@]}"
}

# distro functions
ubuntu() {
  echo -e "${Green}Adding the flatpak ppa. ${Color_Off}"
  sudo add-apt-repository ppa:flatpak/stable

  echo -e "${Green}Updating the repository. ${Color_Off}"
  sudo apt update

  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo apt install flatpak

  echo -e "${Green}Installing the gnome software plugin for flatpak. ${Color_Off}"
  sudo apt install gnome-software-plugin-flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

fedora() {
  echo -e "${Green}Flatpak is installed by default on Fedora Workstation, Fedora Silverblue, and Fedora Kinoite. "
  echo -e "Adding flathub repository. ${Color_Off}"

  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

arch() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo pacman -Sy flatpak
}

debian() {
  echo -e "${Green}Installig Flatpak. ${Color_Off}"
  apt install flatpak

  echo -e "${Green}Installing the gnome software plugin for flatpak. ${Color_Off}"
  apt install gnome-software-plugin-flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

redhat() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo yum install flatpak

  echo -e "${Green}Download and install this flathub repository. ${Color_Off}"
  echo -e "${DYellow}https://flathub.org/repo/flathub.flatpakrepo ${Color_Off}"
}

endavouros() {
  echo -e "${Green}Updating the system. ${Color_Off}"
  sudo pacman -Syu

  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo pacman -Sy flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

opensuse() {
  echo -e "${Green}Installing flatpak. ${Color_Off}"
  sudo zypper install flatpak

  echo -e "${Green}Adding flatpak repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

gentoo() {
  echo -e "${Green}Enabling the ~amd64 keyword for sys-apps/flatpak, acct-user/flatpak and acct-group/flatpak. ${Color_Off}"
  echo -e 'sys-apps/flatpak ~amd64\nacct-user/flatpak ~amd64\nacct-group/flatpak ~amd64\ndev-util/ostree ~amd64' >> /etc/portage/package.accept_keywords/flatpak

  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  emerge sys-apps/flatpak

  echo -e "${Gren}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

kubuntu() {
  echo -e "${Green}Adding the flatpak repository. ${Color_Off}"
  sudo add-apt-repository ppa:alexlarsson/flatpak

  echo -e "${Green}Updating system. ${Color_Off}"
  sudo apt update

  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo apt install flatpak

  echo -e "${Green}Install the Discover Flatpak backend for Kubuntu 20.04 or later. ${Color_Off}"
  sudo apt install plasma-discover-backend-flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

solus() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo eopkg install flatpak xdg-desktop-portal-gtk

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

alpine() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo apk add flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

mageia() {
  HEIGHT=400
  WIDTH=800
  TITLE="Method to install flatpak."
  PROMPT="Flatpak is available for Mageia 6 and newer."
  COLUMN1="Choose One"
  COLUMN2="Description"
  COLUMN3=""

	OPTIONS=(
		dnf "install flatpak using dnf" ""
		urpmi "install flatpak using urpmi" ""
		Cancel "exit this process" ""
	)

  opt=$(createMenu)

	clear

  case "$opt" in
    dnf)
      echo -e "${Green}Installing Flatpak using DNF. ${Color_Off}"
      dnf install flatpak
    ;;

    urpmi)
      echo -e "${Green}Installing Flatpak using urpmi. ${Color_Off}"
      urpmi flatpak
    ;;

    Cancel) echo "Done." ;;

    *) chooseOther ;;
  esac

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

popos() {
  echo -e "${Green}Pop!_OS 20.04 has Flatpak installed and Flathub configured by default. ${Color_Off}"
  echo -e "${Green}The Pop!_Shop can be used to install flatpaks. ${Color_Off}"

  echo -e "${BRed}\nBut if you're running on Pop!_OS 19.10 and earlier, you can continue the installation. ${Color_Off}"
  echo -ne "${DYellow}You want to install it now ? [Y/n] ${Color_Off}"
  read poposInstallFlatpak

  if [[ "$poposInstallFlatpak" = "Y" || "$poposInstallFlatpak" = "y" || "$poposInstallFlatpak" = "" ]]
  then
    echo -e "${Green}Installing Flatpak. ${Color_Off}"
    sudo apt install flatpak

    echo -e "${Green}Adding flathub repository. ${Color_Off}"
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Abort."
  fi
}

raspberrypios() {
  echo -e "${BRed}Flatpak only supported for 64-bit version. ${Color_Off}"
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  apt install flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

clearlinux() {
  echo -e "${Green}Flatpak is installed and Flathub repository is pre-configured by default on Clear Linux. ${Color_Off}"
  sudo swupd bundle-add desktop
}

voidlinux() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo xbps-install -S flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

sulinos() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  su
  inary it flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  su
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

ataraxialinux() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo neko em flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

deepin() {
  echo -e "${Green}Installing Flatpak. ${Color_Off}"
  sudo apt install flatpak

  echo -e "${Green}Adding flathub repository. ${Color_Off}"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  echo -e "${Green}Installing Deepin themes. ${Color_Off}"
  flatpak install flathub org.gtk.Gtk3theme.deepin
  flatpak install flathub org.gtk.Gtk3theme.deepin-dark
}

pardus() {
  echo -e "${Green}Flatpak is available in Pardus 2019 and newer. \n${Color_Off}"

  echo -e "${Green}If you're running on Pardus 2017 and older versions, flatpak is available in the official backports repository. ${Color_Off}"
  echo -e "${Green}Instruction: https://backports.debian.org/Instructions/ ${Color_Off}"

  echo -e "${Green}\nIf you're running on Pardus 2019 and newer, you can continue the installation. ${Color_Off}"
  echo -ne "${DYellow}You want to install it now ? [Y/n] ${Color_Off}"
  read pardusInstallFlatpak

  if [[ "$pardusInstallFlatpak" = "Y" || "$pardusInstallFlatpak" = "y" || "$pardusInstallFlatpak" = "" ]]
  then
    echo -e "${Green}Installing Flatpak. ${Color_Off}"
    apt install flatpak

    echo -e "${Green}Installing flathub repository. ${Color_Off}"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo -e "${Green}\nIf you're running GNOME, it is also a good idea to install the Flatpak plugin for GNOME Software. ${Color_Off}"
    echo -ne "${DYellow}You want to install it now ? [Y/n] ${Color_Off}"
    read pardusGnomePlugin

    if [[ "$pardusGnomePlugin" = "Y" || "$pardusGnomePlugin" = "y" || "$pardusGnomePlugin" = "" ]]
    then
      apt install gnome-software-plugin-flatpak
    else
      echo "Abort."
    fi
  else
    echo "Abort."
  fi
}

pisilinux() {
  echo -e "${Green}Flatpak is available in Pisi 2.1 and newer. ${Color_Off}"

  echo -e "${Green}\nIf you're running on Pisi 2.1 and newer, you can continue the installation. ${Color_Off}"
  echo -ne "${DYellow}You want to install it now ? [Y/n] ${Color_Off}"
  read pisilinuxFlatpak

  if [[ "$pisilinuxFlatpak" = "Y" || "$pisilinuxFlatpak" = "y" || "$pisilinuxFlatpak" = "" ]]
  then
    echo -e "${Green}Installing Flatpak. ${Color_Off}"
    sudo pisi it flatpak

    echo -e "${Green}Adding flathub repository. ${Color_Off}"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Abort."
  fi
}



# -------------------------------------------------------------------------------------
#                                 SCRIPT STARTS
# -------------------------------------------------------------------------------------


# Installing flatpak
echo -e "${Green}It looks like flatpak is NOT installed!"
echo -ne "${DYellow}You want to install it now ? [Y/n] ${Color_Off}"
read flatpakOption

case "$flatpakOption" in
  "Y"|"y"|"")
    while :
    do
      HEIGHT=800
      WIDTH=800
      TITLE="Flatpak Installation"
      PROMPT="Select which distro what distro you are using."
      COLUMN1="Choose Your Distribution"
      COLUMN2="Description"
      COLUMN3="Installed by Default"

      OPTIONS=(
        Ubuntu "A Linux Distro" "NO"
        Fedora "A Linux Distro" "YES"
        Arch "A Linux Distro" "NO"
        Debian "A Linux Distro" "NO"
        Red\ Hat\ Enterprise\ Linux "A Linux Distro" "NO"
        EndavourOS "A Linux Distro" "NO"
        openSUSE "A Linux Distro" "NO"
        Gentoo "A Linux Distro" "NO"
        Kubuntu "A Linux Distro" "NO"
        Solus "A Linux Distro" "NO"
        Alpine "A Linux Distro" "NO"
        Mageia "A Linux Distro" "NO"
        Pop\!_OS "A Linux Distro" "YES"
        Raspberry\ Pi\ OS "A Linux Distro" "NO"
        Clear\ Linux "A Linux Distro" "YES"
        Void\ Linux "A Linux Distro" "NO"
        SulinOS "A Linux Distro" "NO"
        Ataraxia\ Linux "A Linux Distro" "NO"
        Deepin "A Linux Distro" "NO"
        Pardus "A Linux Distro" "NO"
        Pisi\ GNU\ Linux "A Linux Distro" "NO"
        "" "" ""
        Cancel "exit this process" ""
      )

      # menu
      opt=$(createMenu)

      clear

      # case
      case "$opt" in
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

        Cancel) echo "Done."; break ;;

        *) chooseOther ;;
      esac
    done
  ;;

  *) echo "Abort." ;;
esac
