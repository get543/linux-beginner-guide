#! /bin/bash

sound_card_number=1 || $sound_card_number
sink_port=3 || $sink_port

title="Change Output Device"
prompt="Status : unknown $prompt"
column="Choose What Mode"
options=("Speaker Mode" "Headphone Mode")

if [[ $1 == port ]]
then
    echo -ne "Please put the sound card number : "
    read sound_card_number
    echo -ne "Please put the sink port : "
    read sink_port
fi

while opt=$(zenity --title="$title" --text="$prompt" --list --column="$column" "${options[@]}")
do
    case "$opt" in
    "${options[0]}")
        clear

        echo -e "\033[1;31m\n\t\tLooking For Sound Card Number \033[0m"
        aplay --list-devices

        echo -e "\033[1;31m\n\t\tStatus Auto Mute Mode (Item0:) \033[0m"
        amixer -c $sound_card_number set 'Auto-Mute Mode' Disabled

        echo -e "\033[1;31m\n\t\tLooking For Sink Port \033[0m"
        pacmd list-sinks | grep -e name -e index -e description -e muted

        pactl set-sink-port $sink_port analog-output-lineout

        echo -e "\nStatus :\033[1;31m\t\tSpeaker Mode \033[0m"
        zenity --notification --window-icon="info" --text="You are now on '$opt'"
        prompt="Status : Speaker Mode"
        ;;
    "${options[1]}")
        clear

        echo -e "\033[1;31m\n\t\tLooking For Sound Card Number \033[0m"
        aplay --list-devices

        echo -e "\033[1;31m\n\t\tStatus Auto Mute Mode (Item0:) \033[0m"
        amixer -c $sound_card_number set 'Auto-Mute Mode' Enabled

        echo -e "\033[1;31m\n\t\tLooking For Sink Port \033[0m"
        pacmd list-sinks | grep -e name -e index -e description -e muted

        pactl set-sink-port $sink_port analog-output-headphones

        echo -e "\nStatus :\033[1;31m\t\tHeadphone Mode \033[0m"
        zenity --notification --window-icon="info" --text="You are now on '$opt'"
        prompt="Status : Headphone Mode"
        ;;
    *)
        zenity --notification --window-icon="error" --text="Invalid option. You didn't choose any of the options."
        ;;
    esac
done
