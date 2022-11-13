install() {
  echo -e "${DMagenta}================== START INSTALL ==================${Color_Off}"
  cd /tmp/
  wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
  # sha1sum: d1038e6d62cac6f60b0dd8caa8d5849c79065a7b
  unzip droidcam_latest.zip -d droidcam

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
  echo -ne "\nAnd so on .."
  read

  cd /etc/modprobe.d/
  sudo nano droidcam.conf
}

unloadDriver() {
  echo -e "${DMagenta}================== UNLOADING DRIVER ==================${Color_Off}"
  sudo rmmod v4l2loopback_dc

  echo -e "${Green}Reloading driver with the new resolution${Color_Off}"
  echo -ne "${DYellow}Enter new resolution for width : ${Color_Off}"
  read width

  echo -ne "${DYellow}Enter new resolution for height : ${Color_Off}"
  read height

  sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=$width height=$height
}

# ---------------------------------------------------------------------------

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
		Change\ Resolution "changing camera resolution" ""
		Unload\ Driver "ususally do this if there's an error" ""
		Cancel "exit this process" ""
	)

  # menu
  opt=$(createMenu)

	clear

	# case
	case "$opt" in
		Install) install ;;

		Change\ Resolution) changeResolution ;;

		Unload\ Driver) unloadDriver ;;

		Cancel) break; echo "Done." ;;

    *) chooseOther ;;
	esac
done
