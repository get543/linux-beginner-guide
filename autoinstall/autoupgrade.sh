# enable debugging
set -x

# check OS
checkFedoraRedhat() {
    fedoraRedhat=$(grep -Ei 'fedora|redhat' /etc/*release)
}

checkArch() {
    arch=$(grep -Ei 'arch' /etc/*release)
}

checkDebian() {
    debian=$(grep -Ei 'debian|buntu|mint' /etc/*release)
}

checkSUSE() {
    opensuse=$(grep -Ei 'SuSE' /etc/*release)
}

# check nala
checkNala() {
    checkDebian

    if [ "$debian" ]; then
        if (! command -v nala &>/dev/null); then
            echo -e "\n${BRed}nala ${Green}is ${BRed}not ${Green}installed. Using ${BRed}apt ${Green}instead.${Color_Off}\n"
        else
            sudo() {
                if [ "$1" = "apt" ]; then
                    # using nala but with sudo gui prompt
                    shift
                    /usr/bin/sudo nala "$@"
                else
                    # keep apt but with sudo gui prompt
                    /usr/bin/sudo "$@"
                fi
            }
        fi
    fi
}

##########################################################################
#                             MAIN FUNCTION                              #
##########################################################################
main() {
    clear

    checkFedoraRedhat
    checkArch
    checkDebian
    checkSUSE
    
    checkNala

    echo "Running autoupgrade script..."
    if [ "$debian" ]; then
        sudo apt update
        sudo apt upgrade -y
        sudo apt autoremove -y
        sudo apt clean -y

    elif [ "$fedoraRedhat" ]; then
        sudo dnf update --assumeyes
        sudo dnf autoremove --assumeyes
        sudo dnf clean all --assumeyes

    elif [ "$arch" ]; then
        sudo pacman -Syu --noconfirm
        sudo pacman -Scc --noconfirm

    elif [ "$opensuse" ]; then
        echo -e "${Green}Sorry I don't know how to do that on OpenSUSE${Color_Off}"

    else
        echo -e "${Green}I'm sorry you're probably running distro other than.."
        echo -e "fedora/redhat, arch, debian/ubuntu, opensuse${Color_Off}"
        echo -e "working for other distro as well."
        echo -ne "Enter to continue... "
        read
    fi

    if (command -v flatpak &>/dev/null); then
        flatpak update -y
    elif (command -v pip &>/dev/null); then
        pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U
    fi
}

# run main function
main
