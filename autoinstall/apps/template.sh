flatpakOnly() {
  QUESTION="This package is only available in flatpak. \n\nDo you want to continue ?"
  WIDTH="600"
  HEIGHT="200"
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0) # yes
      echo -e "${DMagenta}
      --------------------------------------------------
      |               Installing $PACKAGENAME             |
      -------------------------------------------------- ${Color_Off}"
      flatpak install --assumeyes flathub $ID
    ;;

    1) # no
      echo "Abort."
    ;;

    *)
      chooseOther
    ;;
  esac
}

flatpakAvailable() {
  HEIGHT=400
  WIDTH=800
  PROMPT="Do you want to install it with flatpak ?"
  TITLE="Install With Flatpak ?"
  COLUMN1="Choose One"
  COLUMN2="Description"
  COLUMN3="Note"

  OPTIONS=(
    Yes "continue installation using flatpak" "not all apps better with flatpak"
    No "it will install the regular package from the website" "only provided on debian package (apt | .deb | appimage)"
    Back "go back to the installation menu" "-"
  )

  # menu
  opt=$(createMenu)

  clear

  # case
  case "$opt" in
    Yes)
      echo -e "${DMagenta}
      --------------------------------------------------
      |              Installing $APPNAME               |
      -------------------------------------------------- ${Color_Off}"
      flatpak install --assumeyes flathub $APPID
    ;;

    No)
      if [ "$debian" ]
      then
        echo -e "${DMagenta}
        --------------------------------------------------
        |              Installing $APPNAME               |
        -------------------------------------------------- ${Color_Off}"
        REGULAR_DEBIAN_INSTALL
      else
        echo "Setup is only provided for debian based distros."
        echo -ne "Enter to continue... "
        read
      fi
    ;;

    Back) echo "Done." ;;

    *) chooseOther ;;
  esac
}

defaultInstallOnly() {
  if [ "$debian" ]
  then
    echo -e "${DMagenta}
    --------------------------------------------------
    |           Installing $NAME                     |
    -------------------------------------------------- ${Color_Off}"
    DEBIANSETUP
  else
    echo "Setup is only provided for debian based distros."
    echo -ne "Enter to continue... "
    read
  fi
}

buildFromSource() {
  if [[ "$debian" || "$arch" || "$fedoraRedhat" || "$opensuse" ]]
  then
    echo -e "${DMagenta}
    ------------------------------------------------------
    |    Installing Prerequisite Package For $NAME       |
    ------------------------------------------------------ ${Color_Off}"
    PREREQUISITE

  else
    echo "Prerequisite setup is not available on your distro."
    echo -ne "Enter to continue... "
    read
    exit 1
  fi

  echo -e "${DMagenta}
  --------------------------------------------------
  |       Clone Repo and Installing $NAME          |
  -------------------------------------------------- ${Color_Off}"
  INSTALLATION
}

rmdirIfExist() {
  if [ -f "$1" ]
  then
    echo -e "${Green}\nDeleting $1 debian package...${Color_Off}"
    rm -v $1
  else
    echo -e "${BRed}\nError, $1 file does not exist.${Color_Off}"
  fi
}
