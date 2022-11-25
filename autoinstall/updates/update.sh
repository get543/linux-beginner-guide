updateRepository() {
  QUESTION="Do you want to update the system repository ?"
  WIDTH="600"
  HEIGHT="200"
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0)
      echo -e "\n${DMagenta}============= Updating Repository =============${Color_Off}"

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
        echo -e "working for other distro as well."
        echo -ne "Enter to continue... "
        read
      fi
    ;;

    1)
      echo "Abort."
    ;;

    *)
      chooseOther
      updateRepository
    ;;
  esac
}

updateFlatpak() {
  QUESTION="Update flatpak applications ?"
  WIDTH="600"
  HEIGHT="200"
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0)
      echo -e "\n${DMagenta}============= Updating Flatpak Apps =============${Color_Off}"
      flatpak update
    ;;

    1)
      echo "Abort."
    ;;

    *)
      chooseOther
      updateFlatpak
    ;;
  esac
}

# Check
checkFedoraRedhat
checkArch
checkDebian
checkSUSE
checkNala

# ----------------------------------------------------------------------------
updateRepository

# --------------------------------------------------------------------------
updateFlatpak
