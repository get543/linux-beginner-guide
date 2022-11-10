#! /bin/bash

red="\033[1;31m"
colourOff="\033[0m"

sound_card_number=1 || $sound_card_number
sink_port=3 || $sink_port

title="Change Output Device"
prompt="Status : unknown $prompt"
column="Choose What Mode"
options=("Speaker Mode" "Headphone Mode" "Change Port Number")

lookingsoundcard() {
  echo -e "$red\n\t\tLooking For Sound Card Number $colourOff"
  aplay --list-devices &> soundcardnumber.log
}

lookingsinkport() {
  echo -e "$red\n\t\tLooking For Sink Port $colourOff"
  pacmd list-sinks | grep -e name -e index -e description -e muted &> sinkport.log
}

if [[ $1 == port ]]
then
  lookingsoundcard
  cat soundcardnumber.log
  echo -ne "$red\nPlease put the sound card number : $colourOff"
  read sound_card_number

  clear

  lookingsinkport
  cat sinkport.log
  echo -ne "$red\nPlease put the sink port number : $colourOff"
  read sink_port
fi

while opt=$(zenity --title="$title" --text="$prompt" --list --column="$column" "${options[@]}")
do
  case "$opt" in
    "${options[0]}")
      clear

      # set automute mode
      echo -e "$red\n\t\tStatus Auto Mute Mode (Item0:) $colourOff"
      amixer -c $sound_card_number set 'Auto-Mute Mode' Disabled

      # change output
      pactl set-sink-port $sink_port analog-output-lineout

      # status
      echo -e "\nStatus :$red\t\tSpeaker Mode $colourOff"
      zenity --notification --window-icon="info" --text="You are now on '$opt'"
      prompt="Status : Speaker Mode"
    ;;

    "${options[1]}")
      clear

      # set automute mode
      echo -e "$red\n\t\tStatus Auto Mute Mode (Item0:) $colourOff"
      amixer -c $sound_card_number set 'Auto-Mute Mode' Enabled

      # change output
      pactl set-sink-port $sink_port analog-output-headphones

      # status
      echo -e "\nStatus :$red\t\tHeadphone Mode $colourOff"
      zenity --notification --window-icon="info" --text="You are now on '$opt'"
      prompt="Status : Headphone Mode"
    ;;

    "${options[2]}")
      # list active soundcard
      lookingsoundcard
      zenity --text-info --width=700 --height=500 --title="List of Active Sound Card" --filename="soundcardnumber.log"

      # soundcard number input
      soundcardINPUT=$(zenity --entry --width=500 --title="Sound Card Number" --text="Please put the sound card number :")
      
      # change sound_card_number
      sound_card_number=$soundcardINPUT

      # ------------------------------------------------------------------------------------------------------------------

      # active sinkport
      lookingsinkport
      zenity --text-info --width=700 --height=500 --title "List of Available Sink Port" --filename="sinkport.log"

      # sinkport input
      sinkportINPUT=$(zenity --entry --width=500 --title="Sink Port Number" --text="Please put the sink port number :")

      # change sink_port
      sink_port=$sinkportINPUT
    ;;

    *)
      zenity --notification --window-icon="error" --text="Invalid option. You didn't choose any of the options."
    ;;
  esac
done
