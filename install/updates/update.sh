# Check OS
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

echo -ne "${DYellow}\nDo you want to update the system repository ? [Y/n] ${Color_Off}"
read updateOptions

if [[ "$updateOptions" = "Y" || "$updateOptions" = "y" || "$updateOptions" = "" ]]
then
  if [ "$debian" ]
  then
    sudo apt update
  elif [ "$arch" ]
  then
    sudo pacman -Syu
  elif [ "$fedoraRedhat" ]
  then
    sudo dnf update
  elif [ "$opensuse" ]
  then
    sudo zypper update
  else
    echo -e "${Green}I'm sorry you're probably running distro other than.."
    echo -e "fedora/redhat, arch, debian/ubuntu, opensuse${Color_Off}"
    echo -e "I'm working for other distro as well.${Color_Off}"
    echo -ne "\nEnter to continue... "
    read
  fi
else
  echo "Abort."
fi

echo -ne "${DYellow}\nUpdate flatpak application(s) ? [Y/n] ${Color_Off}"
read flatpakUpdate

if [[ "$flatpakUpdate" = "Y" || "$flatpakUpdate" = "y" || "$flatpakUpdate" = "" ]]
then
  flatpak update

else
  echo "Abort."
fi