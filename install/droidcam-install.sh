#!/bin/bash 

BRed='\033[1;31m'
Color_Off='\033[0m'

echo -ne " ==================================================================== \n"
echo -ne "||               Script For Troubleshooting Droidcam                || \n"
echo -ne " ==================================================================== \n"
echo "(1) Reinstall"
echo "(2) Changing Resolution"
echo "(3) Unload The Driver"
echo "Type number 1 or 2 or 3"
read st1

if [ "$st1" = "1" ]
then
    echo -ne "================== OK START REINSTALLING ================== \n"
    cd /tmp/
    wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
    # sha1sum: d1038e6d62cac6f60b0dd8caa8d5849c79065a7b
    unzip droidcam_latest.zip -d droidcam
    cd droidcam && sudo ./install-client
    sudo ./install-video
    echo -ne "======================== DONE ======================== \n"
elif [ "$st1" = "2" ]
then
    echo -ne "=========== YOU CHOOSE TO EDIT THE RESOLUTION =========== \n"
    echo -ne "change the height and width of your choosing \n"
    read

    cd /etc/modprobe.d/
    sudo nano droidcam.conf
elif [ "$st1" = "3" ]
then
    echo -ne "================== UNLOADING THE DRIVER ================== \n"
    sudo rmmod v4l2loopback_dc
    echo -ne "========================= DONE ========================= \n\n"

    echo "You can reload it again with the new resolution using this command :"
    echo -e "${BRed}sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=1920 height=1080"
    echo -e "${Color_Off}Change 1920 for width and 1080 for height"
else
    echo "You Choose The Wrong Options"
    exit 1
fi
