# Checking wget
echo -e "\nChecking ${BRed}Wget${Color_Off} package is installed or not"

dpkg -s wget &> /dev/null

if [ $? -eq 0 ];
then
  echo "Wget is installed!"
  echo -ne "Press Enter to continue.. "
  read
else
  ./setups/wget-install.sh
fi

# Checking curl
echo -e "\nChecking ${BRed}cURL${Color_Off} package is installed or not"

dpkg -s curl &> /dev/null

if [ $? -eq 0 ];
then
  echo "cURL is installed!"
  echo -ne "Press Enter to continue.. "
  read
else
  ./setups/curl-install.sh
fi

# Checking flatpak
echo -e "\nChecking ${BRed}Flatpak${Color_Off} package is installed or not"

dpkg -s flatpak &> /dev/null

if [ $? -eq 0 ];
then
  echo "Flatpak is installed!"
  echo -ne "Press Enter to continue.. "
  read
else
  ./setups/flatpak-install.sh
fi
