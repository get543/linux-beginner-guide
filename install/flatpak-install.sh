selections=("Yes" "No")
choose_from_menu "Do you want to install flatpak ?" selected_choice "${selections[@]}"

if [ "$selected_choice" = "Yes" ]
then
    selections=(
        "Ubuntu"
        "Fedora"
        "Arch"
        "Debian"
        "Red Hat Enterprise Linux"
        "EndavourOS"
        "openSUSE"
        "Gentoo"
        "Kubuntu"
        "Solus"
        "Alpine"
        "Mageia"
        "Pop!_OS"
        "Raspberry Pi OS"
        "Clear Linux"
        "Void Linux"
        "SulinOS"
        "Ataraxia Linux"
        "Deepin"
        "Pardus"
        "Pisi GNU Linux"
        "Zorin OS"
    )

    choose_from_menu "Choose Your Distributions" selected_choice "${selections[@]}"

    if [ "$selected_choice" = "Ubuntu" ]
    then
        sudo add-apt-repository ppa:flatpak/stable
        sudo apt update
        sudo apt install flatpak

    elif [ "$selected_choice" = "Fedora" ]
    then
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Arch" ]
    then
        sudo pacman -S flatpak

    elif [ "$selected_choice" = "Debian" ]
    then
        apt install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Red Hat Enterprise Linux" ]
    then
        sudo yum install flatpak

    elif [ "$selected_choice" = "openSUSE" ]
    then
        sudo zypper install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "EndavourOS" ]
    then
        sudo pacman -Syu
        sudo pacman -S flatpak
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Gentoo" ]
    then
        echo -e 'sys-apps/flatpak ~amd64\nacct-user/flatpak ~amd64\nacct-group/flatpak ~amd64\ndev-util/ostree ~amd64' >> /etc/portage/package.accept_keywords/flatpak
        emerge sys-apps/flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Kubuntu" ]
    then
        sudo add-apt-repository ppa:alexlarsson/flatpak
        sudo apt update
        sudo apt install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Solus" ]
    then
        sudo eopkg install flatpak xdg-desktop-portal-gtk
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Alpine" ]
    then
        sudo apk add flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Mageia" ]
    then
        dnf install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Pop!_OS" ]
    then
        sudo apt install flatpak
        flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Raspberry Pi OS" ]
    then
        apt install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Clear Linux" ]
    then
        sudo swupd bundle-add desktop

    elif [ "$selected_choice" = "Void Linux" ]
    then
        sudo xbps-install -S flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "SulinOS" ]
    then
        su
        inary it flatpak
        su
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Ataraxia Linux" ]
    then
        sudo neko em flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Deepin" ]
    then
        sudo apt install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Pardus" ]
    then
        apt install flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Pisi GNU Linux" ]
    then
        sudo pisi it flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    elif [ "$selected_choice" = "Zorin OS" ]
    then
        echo "No need, it is already installed by default :)"

    fi



elif [ "$selected_choice" = "No" ]
then
    echo "OK DONE"
fi
