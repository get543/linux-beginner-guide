updateRepository() {
  QUESTION="Do you want to update the system repository ?"
  WIDTH="600"
  HEIGHT="200"
  OKLABEL="Yes"
  CANCELLABEL="No"

  # dialog
  questionDialog

  case "$?" in
    0) # yes
      echo -e "\n${DMagenta}============= Updating Repository =============${Color_Off}"

      if [ "$debian" ]
      then
        sudo apt update
      elif [ "$arch" ]
      then
        sudo pacman -Sy
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

    1) # no
      echo "Abort."
    ;;

    *)
      chooseOther
      updateRepository
    ;;
  esac
}

updateFlatpak() {
  if ( command -v flatpak &> /dev/null )
  then
    QUESTION="Update flatpak applications ?"
    WIDTH="600"
    HEIGHT="200"
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating Flatpak Apps =============${Color_Off}"
        flatpak update
      ;;

      1) # no
        echo "Abort."
      ;;

      *)
        chooseOther
        updateFlatpak
      ;;
    esac
  fi
}

updateYtdlp() {
  if ( command -v yt-dlp &> /dev/null )
  then
    QUESTION="Update yt-dlp package ?"
    WIDTH="600"
    HEIGHT="200"
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating yt-dlp Package =============${Color_Off}"
        sudo yt-dlp -U
      ;;

      1) # no
        echo "Abort."
      ;;

      *)
        chooseOther
        updateYtdlp
      ;;
    esac
  fi
}

updateNode() {
  loadNvm
  if ( command -v node nvm &> /dev/null )
  then
    QUESTION="Update Node JS to the latest LTS release ?"
    WIDTH="600"
    HEIGHT="200"
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating Node JS Package =============${Color_Off}"
        echo -e "${Green}Uninstalling old versions of node.${Color_Off}"
        nvm uninstall --lts

        echo -e "${Green}Installing latest LTS release of node and npm and migrate your existing installed packages.${Color_Off}"
        nvm install 'lts/*' --reinstall-packages-from=default --latest-npm
      ;;

      1) # no
        echo "Abort."
      ;;

      *)
        chooseOther
        updateNode
      ;;
    esac
  fi
}

# Check
checkFedoraRedhat
checkArch
checkDebian
checkSUSE
checkNala

# ----------------------------------------------------------------------------
updateRepository

# ----------------------------------------------------------------------------
updateFlatpak

# ----------------------------------------------------------------------------
updateYtdlp

# ----------------------------------------------------------------------------
updateNode