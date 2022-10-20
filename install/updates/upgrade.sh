upgradeALL() {
  sudo apt upgrade
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

HEIGHT=25
WIDTH=100
CHOICE_HEIGHT=20
BACKTITLE="Install Upgrade"
TITLE="Upgrade Packages Installation"
MENU="Choose One :"

OPTIONS=(
  Upgrade\ All "upgrade all the packages"
  Choose\ Upgrade "choose what package or packages that you want to upgrade"
  Skip "skip upgrading package"
)

# menu
createMenu

clear

# case
case $CHOICE in
  Upgrade\ All) upgradeALL;;

  Choose\ Upgrade) chooseUpgrade ;;

  Skip) echo "Done." ;;
esac