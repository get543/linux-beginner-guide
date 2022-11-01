# Check OS
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

echo -ne "\nDo you want to update the system repository ? [Y/n] "
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
    echo "I'm sorry you're probably running distro other than.."
    echo "fedora/redhat, arch, debian/ubuntu, opensuse"
  fi
else
  echo "Abort."
fi

echo -ne "\nUpdate flatpak application(s) ? [Y/n] "
read flatpakUpdate

if [[ "$flatpakUpdate" = "Y" || "$flatpakUpdate" = "y" || "$flatpakUpdate" = "" ]]
then
  flatpak update

else
  echo "Abort."
fi