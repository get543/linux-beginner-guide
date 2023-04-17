#! /usr/bin/env bash

installMenu() {
  zenity --title="$TITLE" \
        --text="$PROMPT" \
        --list \
        --column="$COLUMN1" \
        --column="$COLUMN2" \
        --column="$COLUMN3" \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        "${OPTIONS[@]}"
}

install() {
  VERSION=$(curl -s "https://api.github.com/repos/dev47apps/droidcam/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

  echo -e "${DMagenta}================== START INSTALL ==================${Color_Off}"
  cd /tmp/

  # sha1sum: 7b213dcf0bb4ac20d17007f52192c7914b10ed3f
  wget -O droidcam_${VERSION}.zip "https://github.com/dev47apps/droidcam/releases/latest/download/droidcam_${VERSION}.zip"
  unzip droidcam_${VERSION}.zip -d droidcam

  cd droidcam
  sudo ./install-client
  sudo ./install-video
  echo -e "${DMagenta}======================== DONE ========================${Color_Off}"
}

changeResolution() {
  echo -e "${DMagenta}================== EDIT THE RESOLUTION ==================${Color_Off}"
  echo -e "change the height and width of your choosing"
  echo -e "${Green}width : 1920 | height : 1080 | 1080p"
  echo -e "width : 1280 | height : 720 | 720p${Color_Off}"
  echo -ne "Enter to continue..."
  read

  sudo nano /etc/modprobe.d/droidcam.conf
}

unloadDriver() {
  echo -e "${DMagenta}================== UNLOADING DRIVER ==================${Color_Off}"
  sudo rmmod v4l2loopback_dc

  widthINPUT=$(zenity --entry --width=500 --title="Reloading driver with the new resolution" --text="Enter the width :")
  width=$widthINPUT

  heightINPUT=$(zenity --entry --width=500 --title="Reloading driver with the new resolution" --text="Enter the height :")
  height=$heightINPUT

  echo -e "${DMagenta}================== LOADING DRIVER With New Resolution ==================${Color_Off}"
  sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=$width height=$height
}

# -------------------------------------------------------------------------------------
#                                 SCRIPT STARTS
# -------------------------------------------------------------------------------------

while :
do
  HEIGHT=400
  WIDTH=800
  PROMPT="Droidcam Install"
  TITLE="Droidcam Client Install"
  COLUMN1="Choose One"
  COLUMN2="Description"
  COLUMN3=""

	OPTIONS=(
		Install "install or reinstall droidcam" ""
		Change\ Resolution "changing webcam resolution by editing config file" ""
		Unload\ Driver "ususally due to an error or to change resolution" ""
		Cancel "exit this process" ""
	)

  # menu
  opt=$(installMenu)

	clear

	# case
	case "$opt" in
		Install) install ;;

		Change\ Resolution) changeResolution ;;

		Unload\ Driver) unloadDriver ;;

		Cancel) break; echo "Done." ;;

    *) echo "You didn't choose option" ;;
	esac
done
