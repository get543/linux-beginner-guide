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
        sudo pacman -Syy
      elif [ "$fedoraRedhat" ]
      then
        sudo dnf update --assumeno
      elif [ "$opensuse" ]
      then
        sudo zypper refresh
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
        flatpak update --assumeyes
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
        echo -e "${Green}Installing latest LTS release of node.${Color_Off}"
        nvm install 'lts/*' --reinstall-packages-from=current --latest-npm
        # nvm install --lts

        # echo -e "${Green}\nUsing node latest LTS release.${Color_Off}"
        # nvm use --lts

        # echo -e "${Green}\nInstalling latest version of npm.${Color_Off}"
        # npm install -g npm@latest corepack@latest

        echo -e "${Green}\n\n\n------------- List installed node version -------------${Color_Off}"
        nvm list
        echo -e "${Green}\n(-> N/A) means that it is not installed.${Color_Off}"
        echo -e "${Green}Type ${BRed}skip ${Green}to skip this process."
        echo -ne "${DYellow}Which version of node you want to uninstall ? ${Color_Off}"
        read nodeVersion

        if [ "$nodeVersion" = "skip" ]
        then
          echo "Done."
          return
        fi

        echo -e "${Green}\nUninstalling old version of node.${Color_Off}"
        nvm uninstall $nodeVersion
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


# -------------------------------------------------------------------------------------
#                                 SCRIPT STARTS
# -------------------------------------------------------------------------------------
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
