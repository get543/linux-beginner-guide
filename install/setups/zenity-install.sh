echo "----------------------------"
echo "  NO  |   Distro"
echo "----------------------------"
echo "  1   |   Fedora/Redhat"
echo "  2   |   Arch"
echo "  3   |   Debian/Ubuntu"
echo "----------------------------"
echo "Choose anything else if you want to skip this"
echo -ne "Choose distibution to install zenity (1-3) : "
read option

if [[ "$option" = 1 ]]
then
    sudo yum install zenity
elif [[ "$option" = 2 ]]
then
    sudo pacman -Sy zenity
elif [[ "$option" = 3 ]]
then
    sudo apt install zenity
else
    echo "Abort."
fi
