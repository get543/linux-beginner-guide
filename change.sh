#! /bin/bash

sound_card_number=2
sink_port=3

title="Change Output Device"
prompt="Pick your mode :"
options=("Speaker Mode" "Headphone Mode")

while opt=$(zenity --title="$title" --text="$prompt" --list --column="Options" "${options[@]}")
do
    case "$opt" in
    "${options[0]}")
        clear

        amixer -c $sound_card_number set 'Auto-Mute Mode' Disabled

        echo -e "\033[1;31m\n\t\tLooking For Sink Port \033[0m"
        pacmd list-sinks | grep -e name -e index -e description -e muted

        pactl set-sink-port $sink_port analog-output-lineout

        echo -e "\nStatus :\033[1;31m\t\tSpeaker Mode \033[0m"
        zenity --notification --window-icon="info" --text="You are now on '$opt'"
        ;;
    "${options[1]}")
        clear

        amixer -c $sound_card_number set 'Auto-Mute Mode' Enabled

        echo -e "\033[1;31m\n\t\tLooking For Sink Port \033[0m"
        pacmd list-sinks | grep -e name -e index -e description -e muted

        pactl set-sink-port $sink_port analog-output-headphones

        echo -e "\nStatus :\033[1;31m\t\tHeadphone Mode \033[0m"
        zenity --notification --window-icon="info" --text="You are now on '$opt'"
        ;;
    *)
        zenity --notification --window-icon="error" --text="Invalid option. You didn't choose any of the options."
        ;;
    esac
done
