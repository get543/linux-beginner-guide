echo -ne "\nDo you want to update the system repository ? [Y/n] "
read updateOptions

if [[ "$updateOptions" = "Y" || "$updateOptions" = "y" || "$updateOptions" = "" ]]
then
  sudo apt update

else
  echo "Abort."
fi

echo -ne "\nUpdate flatpak application(s) ? [Y/n] "
read flatpakUpdate

if [[ "$flatpakUpdate" = "Y" || "$flatpakUpdate" = "y" || "$flatpakUpdate" = "" ]]
then
  flatpak update

else
  echo "Abort."
fi