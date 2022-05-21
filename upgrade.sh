selections=("Upgrade All" "Choose Upgrade")
choose_from_menu " " selected_choice "${selections[@]}"

if [ "$selected_choice" = "Upgrade All" ]
then
    sudo apt upgrade

elif [ "$selected_choice" = "Choose Upgrade" ]
then
    clear

    echo "------------------ List Of Package That Can Be Upgraded ------------------"
    apt list --upgradable
    
    echo -ne "\nType the exact package name you want to upgrade according to the list."
    echo -ne "\nIf you want to do multiple packages, just put a space after each one"
    echo -ne "\n${BRed}It Must Be The Same As What Shown On The List!${Color_Off}"
    echo -ne "\nExample : gimp kdenlive linux-firmware linux-headers-liquorix-amd64 linux-image-liquorix-amd64"
    echo -ne "\nUpgrade Package : "
    read string1

    sudo apt --only-upgrade install $string1
fi