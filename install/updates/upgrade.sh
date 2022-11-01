upgradeALL() {
  # Check OS
  checkFedoraRedhat
  checkArch
  checkDebian
  checkSUSE

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
    echo "I'm sorry you're probably running distro other than.."
    echo "fedora/redhat, arch, debian/ubuntu, opensuse"
  fi
}

chooseUpgrade() {
  while :
  do
    clear

    echo "------------------ List Upgradable Package(s) ------------------"
    apt list --upgradable

    echo -ne "\nType the exact package name you want to upgrade according to the list.\n"
    echo "If you want to do multiple packages, just put a space after each one."
    echo "Usually the package name is before the slash (/)"
    echo -e "Example : ${BRed}gimp kdenlive linux-firmware linux-headers-liquorix-amd64 linux-image-liquorix-amd64${Color_Off}"
    echo -e "Type ${BRed}exit${Color_Off} to exit this process."
    
    echo -ne "\nUpgrade Package : "
    read packageName
    
    if [ "$packageName" = "exit" ]
    then
      echo "Done."
      break
    fi

    sudo apt --only-upgrade install $packageName
  done 
}

# ----------------------------------------------------------------------------------
HEIGHT=400
WIDTH=800
PROMPT="Install Upgrade"
TITLE="Upgrade Packages Installation"
COLUMN1="Choose One"
COLUMN2="Description"
COLUMN3="Note"

OPTIONS=(
  Upgrade\ All "upgrade all the packages" "works on fedora/debian/arch/opensuse"
  Choose\ Upgrade "choose what package or packages that you want to upgrade" "only debian/ubuntu"
  Skip "skip upgrading package" "works on all"
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
