upgradeALL() {
  checkNala

  if [ "$debian" ]
  then
    sudo apt upgrade
  elif [ "$arch" ]
  then
    sudo pacman -Syu
  elif [ "$fedoraRedhat" ]
  then
    sudo dnf upgrade
  elif [ "$opensuse" ]
  then
    sudo zypper update
  else
    echo -e "${Green}I'm sorry you're probably running distro other than.."
    echo -e "fedora/redhat, arch, debian/ubuntu, opensuse"
    echo -e "working for other distro as well.${Color_Off}"
    echo -ne "Enter to continue... "
    read
  fi
}

chooseUpgradeDebian() {
  # using nala
  if (command -v nala &> /dev/null )
  then
    while :
    do
      HEIGHT=800
      WIDTH=700
      TITLE="List Outdated Packages"
      PROMPT="Select which apps you want to update."
      COLUMN1="Checkbox"
      COLUMN2="Package Name"
      COLUMN3="Size"
      COLUMN4="Unit"

      appList=$(command nala list --upgradable | awk '{print $1}' | tr -d '└──' | awk 'NR%2==1' | awk NF | awk '{print "FALSE", $1, "-", "-"}')

      menu=$(checklistMenu)

      choices="${menu[@]}"

      final=$(echo "$choices" | tr "|" " ")

      if [[ ! $final ]]
      then
        break

      else
        clear
        sudo nala install --update --assume-yes $final

      fi
    done

    # using apt
  else
    while :
    do
      HEIGHT=800
      WIDTH=700
      TITLE="List Outdated Packages"
      PROMPT="Select which apps you want to update."
      COLUMN1="Checkbox"
      COLUMN2="Package Name"
      COLUMN3="Size"
      COLUMN3="Unit"

      appList=$(command apt list --upgradable | tail -n +2 | cut -d / -f 1 | awk '{print "FALSE", $1, "-", "-"}')

      menu=$(checklistMenu)

      choices="${menu[@]}"

      final=$(echo "$choices" | tr "|" " ")

      if [[ ! $final ]]
      then
        break

      else
        clear
        sudo apt update
        sudo apt --only-upgrade --assume-yes install $final

      fi
    done
  fi
}

chooseUpgradeFedora() {
  while :
  do
    clear

    HEIGHT=800
    WIDTH=700
    TITLE="List Outdated Packages"
    PROMPT="Select which apps you want to update."
    COLUMN1="Checkbox"
    COLUMN2="Package Name"
    COLUMN3="Size"
    COLUMN4="Unit"

    appList=$(sudo dnf update --assumeno | tail -n +6 | head -n -8 | grep -vE "^(Installing:|Upgrading:|Installing dependencies:|Removing:|Operation aborted.)" | awk '{print "FALSE", $1, $5, $NF}')

    menu=$(checklistMenu)

    choices="${menu[@]}"

    final=$(echo "$choices" | tr "|" " ")

    if [[ ! $final ]]
    then
      break

    else
      clear
      sudo dnf upgrade --assumeyes $final

    fi
  done
}

chooseUpgradeArch() {
  while :
  do
    clear

    echo -e "\n${DMagenta}============= List Upgradable Packages =============${Color_Off}"
    no &> /dev/null | LC_ALL=en_US.UTF-8 sudo pacman -Syu

    echo -e "\n${DMagenta}=====================================================================================================${Color_Off}"
    echo -e "Type the exact package name you want to upgrade according to the ${BRed}Packages${ColorOff} section."
    echo -e "If you want to do multiple packages, just put a space after each one."
    echo -e "\n${Green}Please do not include the version number. ${BRed}Only type the package name !${Color_Off}"
    echo -e "\nExample : ${BRed}gimp kdenlive linux-firmware linux-headers-liquorix-amd64 linux-image-liquorix-amd64"
    echo -e "${Green}Type ${BRed}exit ${Green}to exit this process."
    echo -e "${DMagenta}=====================================================================================================${Color_Off}"

    echo -ne "${DYellow}\nUpgrade Package : ${Color_Off}"
    read packageName

    if [ "$packageName" = "exit" ]
    then
      echo "Done."
      break
    fi

    clear
    echo -e "\n${DMagenta}============= Upgrading $packageName =============${Color_Off}\n"
    sudo pacman -Sy $packageName
  done
}


# -------------------------------------------------------------------------------------
#                                 SCRIPT STARTS
# -------------------------------------------------------------------------------------
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

HEIGHT=400
WIDTH=900
TITLE="Upgrade Packages Installation"
PROMPT="Install Upgrade"
COLUMN1="Choose One"
COLUMN2="Description"
COLUMN3="Distros"

OPTIONS=(
  Upgrade\ All "upgrade all the packages" "works on fedora, debian, arch, and opensuse"
  Choose\ Upgrade "choose what package or packages that you want to upgrade" "works on fedora, debian, and arch"
  Skip "skip upgrading package" "-"
)

# menu
opt=$(createMenu)

clear

# case
case "$opt" in
  Upgrade\ All) upgradeALL ;;

  Choose\ Upgrade)
    if [ "$debian" ]
    then
      chooseUpgradeDebian
    elif [ "$fedoraRedhat" ]
    then
      chooseUpgradeFedora
    elif [ "$arch" ]
    then
      chooseUpgradeArch
    else
      echo -e "${Green}This option is only for debian, fedora, and arch based distros."
      sleep 5
    fi
  ;;

  Skip) echo "Done." ;;

  *) chooseOther ;;
esac
