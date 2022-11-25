#! /usr/bin/env bash

script_directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# check for logs folder
if ( ! $(cd $script_directory/logs &> /dev/null) )
then
  mkdir $script_directory/logs
  touch $script_directory/logs/soundcardnumber.log
  touch $script_directory/logs/sinkport.log
fi

red="\033[1;31m"
colour_off="\033[0m"

sound_card_number=1 || $sound_card_number
sink_port=3 || $sink_port

soundcardnumber_logs="$script_directory/logs/soundcardnumber.log"
sinkport_logs="$script_directory/logs/sinkport.log"

title="Change Output Device"
prompt="Status : unknown"
column="Choose What Mode"
options=("Speaker Mode" "Headphone Mode" "Change Port Number")
headphones="$script_directory/icons/headphones.png"
speaker="$script_directory/icons/speaker.png"
output="$script_directory/icons/output.png"

main_menu() {
  zenity --title="$title" \
        --text="$prompt" \
        --window-icon="$output" \
        --list \
        --column="$column" \
        "${options[@]}"
}

choose_other_options() {
  zenity --notification \
        --window-icon="error" \
        --text="Invalid option. You didn't choose any of the options."
}


looking_soundcardnumber() {
  echo -e "${red}\n\t\tLooking For Sound Card Number ${colour_off}"
  aplay --list-devices &> $soundcardnumber_logs
}

looking_sinkport() {
  echo -e "${red}\n\t\tLooking For Sink Port ${colour_off}"
  pacmd list-sinks | grep -e name -e index -e description -e muted &> $sinkport_logs
}

changeport_terminal() {
  looking_soundcardnumber
  cat $soundcardnumber_logs
  echo -ne "${red}\nPlease put the sound card number : ${colour_off}"
  read sound_card_number

  clear

  looking_sinkport
  cat $sinkport_logs
  echo -ne "${red}\nPlease put the sink port number : ${colour_off}"
  read sink_port
}

changeport_menu() {
  # list active soundcard
  looking_soundcardnumber
  zenity --text-info --width=700 --height=500 --title="List of Active Sound Card" --filename="$soundcardnumber_logs"

  # soundcard number input
  soundcardnumber_user_input=$(zenity --entry --width=500 --title="Sound Card Number" --text="Please put the sound card number :")
  
  # change sound_card_number variables to match user input
  sound_card_number=$soundcardnumber_user_input

  # -----------------------------------------
  #           sink port
  # -----------------------------------------

  # list active sinkport
  looking_sinkport
  zenity --text-info --width=700 --height=500 --title="List of Available Sink Port" --filename="$sinkport_logs"

  # sinkport input
  sinkport_user_input=$(zenity --entry --width=500 --title="Sink Port Number" --text="Please put the sink port number :")

  # change sink_port variables to match user input
  sink_port=$sinkport_user_input
}

speaker_mode() {
  clear

  # set automute mode to disabled
  echo -e "${red}\n\t\tStatus Auto Mute Mode (Item0:) ${colour_off}"
  amixer -c $sound_card_number set 'Auto-Mute Mode' Disabled

  # change output to speaker
  pactl set-sink-port $sink_port analog-output-lineout

  # display status
  echo -e "\nStatus :${red}\t\tSpeaker Mode ${colour_off}"
  zenity --notification --window-icon="$speaker" --text="You are now on '$opt'" 
  prompt="Status : Speaker Mode"
}

headphone_mode() {
  clear

  # set automute mode to enabled
  echo -e "${red}\n\t\tStatus Auto Mute Mode (Item0:) ${colour_off}"
  amixer -c $sound_card_number set 'Auto-Mute Mode' Enabled

  # change output to headphone
  pactl set-sink-port $sink_port analog-output-headphones

  # display status
  echo -e "\nStatus :${red}\t\tHeadphone Mode ${colour_off}"
  zenity --notification --window-icon="$headphones" --text="You are now on '$opt'"
  prompt="Status : Headphone Mode"
}

if [[ $1 = port ]]
then
  changeport_terminal
fi

while opt=$(main_menu)
do
  case "$opt" in
    "${options[0]}") speaker_mode ;;

    "${options[1]}") headphone_mode ;;

    "${options[2]}") changeport_menu ;;

    *) choose_other_options ;;
  esac
done
