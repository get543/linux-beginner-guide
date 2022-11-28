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
      flatpak install flathub $ID
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
    No "it will install the regular package from the website" "only provided on debian package (apt or .deb)"
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
      flatpak install flathub $APPID
    ;;

    No)
      if [ "$debian" ]
      then
        echo -e "${DMagenta}
        --------------------------------------------------
        |              Installing $APPNAME                |
        -------------------------------------------------- ${Color_Off}"
        REGULARINSTALL
      else
        echo "Only provided on debian package (apt or .deb)"
        echo -ne "Enter to continue... "
        read
      fi
    ;;

    Back) echo "Done." ;;

    *) chooseOther ;;
  esac
}