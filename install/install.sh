#!/bin/bash

BRed='\033[1;31m'
Color_Off='\033[0m'

function choose_from_menu() {
   local prompt="$1" outvar="$2"
   shift
   shift
   local options=("$@") cur=0 count=${#options[@]} index=0
   local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes
   printf "$prompt\n"

   while true
   do
      # list all options (option list is zero-based)
      index=0
      for o in "${options[@]}"
      do
         if [ "$index" == "$cur" ]
         then
            echo -e "  \e[7m$o\e[0m" # mark & highlight the current option
         else
            echo "  $o"
         fi

         index=$(( $index + 1 ))
      done

      read -s -n3 key # wait for user to key in arrows or ENTER

      if [[ $key == $esc[A ]] # up arrow
      then
         cur=$(( $cur - 1 ))
         [ "$cur" -lt 0 ] && cur=0
      elif [[ $key == $esc[B ]] # down arrow
      then
         cur=$(( $cur + 1 ))
         [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
      elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
      then
         break
      fi

      echo -en "\e[${count}A" # go up to the beginning to re-render
   done
   # export the selection to the requested output variable
   printf -v $outvar "${options[$cur]}"
}

export -f choose_from_menu # export functions
export BRed
export Color_Off

# making sure that the file is executable
chmod +x flatpak-install.sh
chmod +x upgrade.sh
chmod +x droidcam-install.sh

# ----------------------------------------------------------------------------------------------------------------------------
### Start of the script

# Checking Flatpak
echo "Some of these packages requires flatpak to be installed"
echo "We are checking if flatpak installed or not"

dpkg -s flatpak &> /dev/null

if [ $? -eq 0 ];
then
   echo "Package flatpak is installed!"

else
   echo "It looks like flatpak is NOT installed!"
   # echo "Go To This Website To Install It : https://flatpak.org/setup/"
   ./flatpak-install.sh

fi


### Updating System
echo "------------------------ We Are Updating System ------------------------"
echo -ne "Do you want to update the system ? [Y/n] "
read updateOptions

if [[ "$updateOptions" = "Y" || "$updateOptions" = "y" || "$updateOptions" = "" ]]
then
   sudo apt update
   echo -ne "\n--------------- List Upgradable Package(s) ---------------\n"
   apt list --upgradable

   ./upgrade.sh

   # Update flatpak apps
   echo -ne "\nUpdating flatpak application(s) ? [Y/n] "
   read flatpakUpdate

   if [[ "$flatpakUpdate" = "Y" || "$flatpakUpdate" = "y" || "$flatpakUpdate" = "" ]]
   then
      flatpak update

   else
      echo "Ok Continuing.. "
   fi

else
   echo "Ok Continuing.. "
fi



### Installation Apps
while :
do
   clear

   selections=(
      "Ao"
      "Audacity"
      "balena-etcher"
      "Deckboard"
      "Discord"
      "Droidcam"
      "Geary"
      "Git"
      "GNU Image Manipulation Program (GIMP)"
      "Gnome Tweaks"
      "Indicator-Sound-Switcher"
      "Inkscape"
      "Kdenlive"
      "KolourPaint"
      "Obsidian"
      "OBS Studio"
      "OpenRGB"
      "Pinta"
      "pulseaudio and pavucontrol"
      "Rambox"
      "ScrCpy"
      "simplescreenrecorder"
      "Spotify"
      "Telegram Desktop"
      "Visual Studio Code"
      "Virtual Machine Manager"
      "VLC"
      "WhatsApp Desktop"
      "WINE"
      "yt-dlp"
      "Zoom"

      "Exit"
   )

   choose_from_menu "What app you want to install ?" selected_choice "${selections[@]}"

   clear
   # echo -ne "\nYou Selected ${BRed}$selected_choice \n${Color_Off}"

   if [ "$selected_choice" = "Ao" ]
   then
      echo "
      --------------------------------------------------
      |                Installing Ao                   |
      --------------------------------------------------"
      wget https://github.com/klaussinani/ao/releases/download/v6.9.0/ao_6.9.0_amd64.deb -O ~/Downloads/ao-6.9-amd64.deb
      cd ~/Downloads
      sudo dpkg -i ao-6.9-amd64.deb



   elif [ "$selected_choice" = "GNU Image Manipulation Program (GIMP)" ]
   then
      echo "
      --------------------------------------------------
      |               Installing GIMP                  |
      --------------------------------------------------"

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
      elif [ "$selected_choice" = "No" ]
      then
         sudo apt install gimp
      fi



   elif [ "$selected_choice" = "Git" ]
   then
      echo "
      --------------------------------------------------
      |                 Installing Git                 |
      --------------------------------------------------"
      sudo apt install git



   elif [ "$selected_choice" = "pulseaudio and pavucontrol" ]
   then
      echo "
      --------------------------------------------------
      |      Installing pulseaudio and pavucontrol     |
      --------------------------------------------------"
      sudo apt install pulseaudio pavucontrol



   elif [ "$selected_choice" = "Rambox" ]
   then
      echo "
      --------------------------------------------------
      |               Installing Rambox                |
      --------------------------------------------------"
      wget https://rambox.app/api/download?os=linux&package=deb -O ~/Downloads/rambox-2.0.deb
      cd ~/Downloads
      sudo dpkg -i rambox-2.0.deb



   elif [ "$selected_choice" = "ScrCpy" ]
   then
      echo "
      --------------------------------------------------
      |               Installing ScrCpy                |
      --------------------------------------------------"
      apt install scrcpy



   elif [ "$selected_choice" = "simplescreenrecorder" ]
   then
      echo -ne "
      --------------------------------------------------
      |         Installing simplescreenrecorder        |
      --------------------------------------------------
      "
      sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
      sudo apt-get update
      sudo apt-get install simplescreenrecorder



   elif [ "$selected_choice" = "Spotify" ]
   then
      echo -ne "
      --------------------------------------------------
      |               Installing Spotify               |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub com.spotify.Client
      elif [ "$selected_choice" = "No" ]
      then
         curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
         echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

         sudo apt-get update && sudo apt-get install spotify-client
      fi



   elif [ "$selected_choice" = "VLC" ]
   then
      echo -ne "
      --------------------------------------------------
      |                  Installing VLC                |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ? (if no, using snap instead)" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub org.videolan.VLC
      elif [ "$selected_choice" = "No" ]
      then
         sudo snap install vlc
      fi



   elif [ "$selected_choice" = "Zoom" ]
   then
      echo -ne "
      --------------------------------------------------
      |                  Installing Zoom               |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub us.zoom.Zoom
      elif [ "$selected_choice" = "No" ]
      then
         clear
         wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Downloads/zoom_amd64.deb
         cd ~/Downloads
         sudo dpkg -i zoom_amd64.deb
      fi



   elif [ "$selected_choice" = "balena-etcher" ]
   then
      echo -ne "
      --------------------------------------------------
      |           Installing balena-etcher             |
      --------------------------------------------------
      "
      curl -1sLf \
         'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
         | sudo -E bash

      sudo apt-get update
      sudo apt-get install balena-etcher-electron



   elif [ "$selected_choice" = "Visual Studio Code" ]
   then
      echo -ne "
      --------------------------------------------------
      |         Installing Visual Studio Code          |
      --------------------------------------------------
      "
      sudo apt install software-properties-common apt-transport-https wget
      wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
      sudo apt install code



   elif [ "$selected_choice" = "Discord" ]
   then
      echo -ne "
      --------------------------------------------------
      |              Installing Discord                |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub com.discordapp.Discord
      elif [ "$selected_choice" = "No" ]
      then
         clear
         wget https://discord.com/api/download?platform=linux&format=deb -O ~/Downloads/discord.deb
         cd ~/Downloads
         sudo dpkg -i discord.deb
      fi



   elif [ "$selected_choice" = "Kdenlive" ]
   then
      echo -ne "
      --------------------------------------------------
      |                Installing Kdenlive             |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub org.kde.kdenlive
      elif [ "$selected_choice" = "No" ]
      then
         sudo add-apt-repository ppa:kdenlive/kdenlive-stable
         sudo apt-get update
         sudo apt-get install kdenlive
      fi



   elif [ "$selected_choice" = "Audacity" ]
   then
      echo -ne "
      --------------------------------------------------
      |               Installing Audacity              |
      --------------------------------------------------
      "
      flatpak install flathub org.audacityteam.Audacity



   elif [ "$selected_choice" = "Droidcam" ]
   then
      echo -ne "
      --------------------------------------------------
      |             Installing Droidcam                |
      --------------------------------------------------\n"
      ./droidcam-install.sh



   elif [ "$selected_choice" = "Indicator-Sound-Switcher" ]
   then
      echo -ne "
      --------------------------------------------------
      |      Installing Indicator-Sound-Switcher       |
      --------------------------------------------------
      "
      sudo apt-add-repository ppa:yktooo/ppa
      sudo apt-get update
      sudo apt-get install indicator-sound-switcher



   elif [ "$selected_choice" = "Inkscape" ]
   then
      echo -ne "
      --------------------------------------------------
      |               Installing Inkscape              |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
         flatpak install flathub org.inkscape.Inkscape
      elif [ "$selected_choice" = "No" ]
      then
         sudo add-apt-repository ppa:inkscape.dev/stable
         sudo apt update
         sudo apt install inkscape
      fi



   elif [ "$selected_choice" = "OBS Studio" ]
   then
      echo -ne "
      --------------------------------------------------
      |             Installing OBS Studio              |
      --------------------------------------------------
      "
      sudo add-apt-repository ppa:obsproject/obs-studio
      sudo apt update
      sudo apt install ffmpeg obs-studio



   elif [ "$selected_choice" = "Pinta" ]
   then
      echo -ne "
      --------------------------------------------------
      |                Installing Pinta                |
      --------------------------------------------------
      "
      flatpak install flathub com.github.PintaProject.Pinta



   elif [ "$selected_choice" = "Obsidian" ]
   then
      echo -ne "
      --------------------------------------------------
      |              Installing Obsidian               |
      --------------------------------------------------
      "
      flatpak install flathub md.obsidian.Obsidian



   elif [ "$selected_choice" = "WINE" ]
   then
      echo -ne "
      --------------------------------------------------
      |                 Installing WINE                |
      --------------------------------------------------
      "
      sudo dpkg --add-architecture i386
      wget -nc https://dl.winehq.org/wine-builds/winehq.key
      sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

      selections=("18.04" "20.04" "22.04")
      choose_from_menu "Select Your Ubuntu Version :" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "18.04" ]
      then
         # ubuntu 18.04
         wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources
         sudo mv winehq-bionic.sources /etc/apt/sources.list.d/
      elif [ "$selected_choice" = "20.04" ]
      then
         # ubuntu 20.04
         wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
         sudo mv winehq-focal.sources /etc/apt/sources.list.d/
      elif [ "$selected_choice" = "22.04" ]
      then
         # ubuntu 22.04
         wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
         sudo mv winehq-jammy.sources /etc/apt/sources.list.d/
      fi

      sudo apt update
      sudo apt install --install-recommends winehq-stable



   elif [ "$selected_choice" = "Telegram Desktop" ]
   then
      echo -ne "
      --------------------------------------------------
      |         Installing Telegram Desktop            |
      --------------------------------------------------
      "
      flatpak install flathub org.telegram.desktop



   elif [ "$selected_choice" = "OpenRGB" ]
   then
      echo -ne "
      --------------------------------------------------
      |              Installing OpenRGB                |
      --------------------------------------------------
      "

      selections=("Yes" "No")
      choose_from_menu "Do you want to install it with flatpak ?" selected_choice "${selections[@]}"

      if [ "$selected_choice" = "Yes" ]
      then
      	flatpak install flathub org.openrgb.OpenRGB

      elif [ "$selected_choice" = "No" ]
      then
         selections=("20.10 and older" "21.04 and newer")
         choose_from_menu "Choose Your Ubuntu Version" selected_choice "${selections[@]}"

         if [ "$selected_choice" = "20.10 and older" ]
         then
            clear
            wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_buster_6128731.deb -O ~/Downloads/openrgb-buster.deb
            cd ~/Downloads
            sudo dpkg -i openrgb-buster.deb

         elif [ "$selected_choice" = "21.04 and newer" ]
         then
            clear
            wget https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_bullseye_6128731.deb -O ~/Downloads/openrgb-bullseye.deb
            cd ~/Downloads
            sudo dpkg -i openrgb-bullseye.deb

         fi

      fi



   elif [ "$selected_choice" = "yt-dlp" ]
   then
      echo -ne "
      --------------------------------------------------
      |              Installing yt-dlp                 |
      --------------------------------------------------
      "
      sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
      sudo chmod a+rx /usr/local/bin/yt-dlp



   elif [ "$selected_choice" = "Virtual Machine Manager" ]
   then
      echo -ne "
      --------------------------------------------------
      |       Installing Virtual Machine Manager       |
      --------------------------------------------------
      "
      virtualization=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
      echo "cpuinfo vm|svmx = $virtualization"

      if [ $virtualization > 0 ]
      then
         echo "You have enabled virtualization on your machine"
         echo "Proceed installing..."
         sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

         echo "Verify that libvirt is running..."
         sudo systemctl status libvirtd.service | grep running

         echo "Setting up network by default and autostart..."
         sudo virsh net-start default
         sudo virsh net-autostart default

         echo "Checking network status..."
         sudo virsh net-list --all

         echo "Adding libvirt user..."
         sudo adduser $(whoami) libvirt
         sudo adduser $(whoami) libvirt-qemu

      elif [ $virtualization = 0 ]
      then
         echo "If the number shows 0, then enable virtualization on bios settings"
         echo "Enable VT-x (Virtualization Technology Extension) for Intel processor"
         echo "Enable AMD-V for AMD processor"

         break
      fi



   elif [ "$selected_choice" = "Gnome Tweaks" ]
   then
      echo -ne "
      --------------------------------------------------
      |            Installing Gnome Tweaks             |
      --------------------------------------------------
      "
      sudo apt install gnome-tweaks
      sudo apt install gnome-shell-extensions
      echo "Install this firefox extension : https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search"
      echo "And you're good :)"



   elif [ "$selected_choice" = "Geary" ]
   then
      echo -ne "
      --------------------------------------------------
      |                Installing Geary                |
      --------------------------------------------------
      "
      sudo apt install geary



   elif [ "$selected_choice" = "WhatsApp Desktop" ]
   then
      echo -ne "
      --------------------------------------------------
      |          Installing WhatsApp Desktop           |
      --------------------------------------------------
      "
      flatpak install flathub io.github.mimbrero.WhatsAppDesktop



   elif [ "$selected_choice" = "KolourPaint" ]
   then
      echo -ne "
      --------------------------------------------------
      |             Installing KolourPaint             |
      --------------------------------------------------
      "
      flatpak install flathub org.kde.kolourpaint



   elif [ "$selected_choice" = "Deckboard" ]
   then
      echo -ne "
      --------------------------------------------------
      |             Installing Deckboard               |
      --------------------------------------------------
      "
      wget https://github.com/rivafarabi/deckboard/releases/download/v2.0.2/deckboard_2.0.2_amd64.deb -O ~/Downloads/deckboard_2.0.2.deb
      cd ~/Downloads
      sudo apt install ./deckboard_2.0.2.deb
      sudo apt --fix-broken install
      sudo apt install ./deckboard_2.0.2.deb



   elif [ "$selected_choice" = "Exit" ]
   then
      break

   else
      echo "idk what you choose or maybe just an error in the program"

   fi


done


# Remove unused package
echo -ne "\nRemove unused package(s) ? [Y/n] "
read removePackage

if [[ "$removePackage" = "Y" || "$removePackage" = "y" || "$removePackage" = "" ]]
then
   sudo apt autoremove
   sudo apt autoclean

else
   echo "Ok Continuing.. "
fi

echo -ne "
      --------------------------------------------------
      |           Done, Thank You For Using            |
      --------------------------------------------------\n"


: ' Before Running This File
    Do This In The Terminal:
    - cat /etc/shells
    - which bash
    Make This Into Executable:
    - chmod +x install.sh
    Run The File:
    - ./install.sh'
