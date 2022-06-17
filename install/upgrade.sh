selections=("Upgrade All" "Choose Upgrade" "Skip")
choose_from_menu " " selected_choice "${selections[@]}"

if [ "$selected_choice" = "Upgrade All" ]
then
    sudo apt upgrade

elif [ "$selected_choice" = "Choose Upgrade" ]
then
    while :
    do
        clear

        echo "------------------ List Upgradable Package(s) ------------------"
        apt list --upgradable

        echo -ne "\nType the exact package name you want to upgrade according to the list."
        echo -ne "\nIf you want to do multiple packages, just put a space after each one"
        echo -ne "\nIt Must Be The Same As What Shown On The List!${Color_Off}"
        echo -ne "\nExample : ${BRed}gimp kdenlive linux-firmware linux-headers-liquorix-amd64 linux-image-liquorix-amd64${Color_Off}"
        echo -ne "\nType ${BRed}exit${Color_Off} to exit this process"
        echo -ne "\nUpgrade Package : "
        read packageName

        if [ "$packageName" = "exit" ]
        then
            break
        fi

        sudo apt --only-upgrade install $packageName
    done
    
elif [ "$selected_choice" = "Skip" ]
then
    echo "OK Skip Upgrading Process..."

fi
