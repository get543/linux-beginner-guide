updateRepository() {
  QUESTION="Do you want to update the system repository ?"
  WIDTH=600
  HEIGHT=200
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
    WIDTH=600
    HEIGHT=200
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        while :
        do
          HEIGHT=800
          WIDTH=700
          TITLE="List Outdated Flatpak Applications"
          PROMPT="Select apps you want to update."
          COLUMN1="Checkbox"
          COLUMN2="ID"
          COLUMN3="Size"
          COLUMN4="Unit"

          appList=$(no &> /dev/null | LC_ALL=en_US.UTF-8 flatpak update | tail -n +4 | head -n -2 | awk '{print "FALSE", $2, $7, "-"}')

          menu=$(checklistMenu)

          choices="${menu[@]}"

          final=$(echo "$choices" | tr "|" " ")

          if [[ ! $final ]]
          then
            break

          else
            clear
            flatpak update --assumeyes $final

          fi
        done
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
    WIDTH=600
    HEIGHT=200
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
    WIDTH=600
    HEIGHT=200
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating Node JS Package =============${Color_Off}"
        echo -e "${Green}Use the latest LTS version of Node JS.${Color_Off}"
        nvm use --lts

        echo -e "${Green}\nInstalling latest LTS release of node.${Color_Off}"
        nvm install 'lts/*' --reinstall-packages-from=current --latest-npm

        echo -e "${Green}\n\n------------- List installed node version -------------${Color_Off}"
        nvm list

        while :
        do
          HEIGHT=800
          WIDTH=700
          TITLE="List All Installed Node Versions"
          PROMPT="Select which node version you want to uninstall."
          COLUMN1="Checkbox"
          COLUMN2="Node Version"
          COLUMN3="-"
          COLUMN4="-"

          appList=$(command ls $NVM_DIR/versions/node | awk '{print "FALSE", $1}')

          menu=$(checklistMenu)

          choices="${menu[@]}"

          final=$(echo "$choices" | tr "|" "\n")

          if [[ ! $final ]]
          then
            break

          else
            for version in $final
            do
              echo -e "\n${Green}Uninstalling node ${version} using nvm command.${Color_Off}"
              nvm uninstall --lts=$version

              echo -e "\n${Green}Removing node ${version} directory.${Color_Off}"
              rm -rfv $NVM_DIR/versions/node/$version
            done
          fi
        done
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

updatePipPackages() {
  if ( command -v pip &> /dev/null )
  then
    QUESTION="Update outdated pip packages ?"
    WIDTH=600
    HEIGHT=200
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating pip Packages =============${Color_Off}"
        pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U
      ;;

      1) # no
        echo "Abort."
      ;;

      *)
        chooseOther
        updatePipPackages
      ;;
    esac
  fi
}

updateRust() {
  if ( command -v rustup &> /dev/null )
  then
    QUESTION="Update rust to the latest stable release ?"
    WIDTH=600
    HEIGHT=200
    OKLABEL="Yes"
    CANCELLABEL="No"

    # dialog
    questionDialog

    case "$?" in
      0) # yes
        echo -e "\n${DMagenta}============= Updating Rust Package =============${Color_Off}"
        rustup check
        rustup update
      ;;

      1) # no
        echo "Abort."
      ;;

      *)
        chooseOther
        updateRust
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

# ----------------------------------------------------------------------------
updatePipPackages

# ----------------------------------------------------------------------------
updateRust
