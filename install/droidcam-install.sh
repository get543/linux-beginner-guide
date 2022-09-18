#!/bin/bash

echo "===================================================================="
echo "||               Script For Troubleshooting Droidcam              ||"
echo "===================================================================="
echo "(1) Install or Reinstall"
echo "(2) Change Resolution"
echo "(3) Unload Driver"
echo "(4) Cancel"
echo "Type number 1 or 2 or 3 or 4"
read st1

if [ "$st1" = "1" ]
then
    echo "================== OK START REINSTALLING =================="
    cd /tmp/
    wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
    # sha1sum: d1038e6d62cac6f60b0dd8caa8d5849c79065a7b
    unzip droidcam_latest.zip -d droidcam
    cd droidcam && sudo ./install-client
    sudo ./install-video
    echo "======================== DONE ========================"

elif [ "$st1" = "2" ]
then
    echo "================== EDIT THE RESOLUTION =================="
    echo "change the height and width of your choosing"
    echo "width : 1920 | height : 1080 | 1080p"
    echo "width : 1280 | height : 720 | 720p"
    echo "And so on .."
    read

    cd /etc/modprobe.d/
    sudo nano droidcam.conf

elif [ "$st1" = "3" ]
then
    echo "================== UNLOADING THE DRIVER =================="
    sudo rmmod v4l2loopback_dc
    echo "========================= DONE ========================= \n"

    echo "Reloading driver with the new resolution"
    echo -ne "Enter new resolution for width : "
    read width

    echo -ne "Enter new resolution for height : "
    read height

    sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=$width height=$height

elif [ "$st1" = "4" ]
then
    echo "Cancel.."
    echo -ne "Press Enter To Continue..."
    read

else
    echo "You Choose The Wrong Options"
    exit 1
fi
