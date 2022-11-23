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
    sudo zypper upgrade
  else
    echo -e "${Green}I'm sorry you're probably running distro other than.."
    echo -e "fedora/redhat, arch, debian/ubuntu, opensuse"
    echo -e "working for other distro as well.${Color_Off}"
    echo -ne "Enter to continue... "
    read
  fi
}

chooseUpgrade() {
  if [[ "$debian" ]]
  then
    while :
    do
      clear

      echo -e "\n${DMagenta}============= List Upgradable Packages =============${Color_Off}"

      # check nala
      if ( ! command -v nala &> /dev/null )
      then
        apt list --upgradable
      else
        nala list --upgradable
      fi

      echo -e "\n${DMagenta}=====================================================================================================${Color_Off}"
      echo -e "Type the exact package name you want to upgrade according to the list."
      echo -e "If you want to do multiple packages, just put a space after each one."
      echo -e "\n${Green}Usually the package name is before the slash (/)."
      echo -e "${Green}If you are using ${BRed}nala ${Green}the package name usually have different colors.${Color_Off}"
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

      echo -e "\n${Green}Back to using ${BRed}apt ${Green}because nala doesn't support this process.${Color_Off}\n"
      sudo apt --only-upgrade install $packageName
    done
  else
    echo -e "${Green}This option is only for debian based distros only."
    echo -e "As far as I know only debian can do this.${Color_Off}"
  fi
}

# check
checkFedoraRedhat
checkArch
checkDebian
checkSUSE

# ----------------------------------------------------------------------------------
HEIGHT=300
WIDTH=900
PROMPT="Install Upgrade"
TITLE="Upgrade Packages Installation"
COLUMN1="Choose One"
COLUMN2="Description"
COLUMN3="Distros"

OPTIONS=(
  Upgrade\ All "upgrade all the packages" "works on fedora, debian, arch, and opensuse"
  Choose\ Upgrade "choose what package or packages that you want to upgrade" "works only on debian/ubuntu"
  Skip "skip upgrading package" "-"
)

# menu
opt=$(createMenu)

clear

# case
case "$opt" in
  Upgrade\ All) upgradeALL;;

  Choose\ Upgrade) chooseUpgrade ;;

  Skip) echo "Done." ;;

  *) chooseOther ;;
esac
