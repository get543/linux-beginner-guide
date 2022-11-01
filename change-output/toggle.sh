#! /bin/bash

sound_card_number=1 || $sound_card_number
sink_port=3 || $sink_port

if [[ $1 == port ]]
then
    echo -e "\033[1;31m\n\t\tActive Sound Card \033[0m"
    aplay --list-devices
    echo -ne "\033[1;31mPlease put the sound card number :\033[0m "
    read sound_card_number

    echo -e "\033[1;31m\n\t\tActive Sink Port \033[0m"
    pacmd list-sinks | grep -e name -e index -e description -e muted
    echo -ne "\033[1;31mPlease put the sink port :\033[0m "
    read sink_port
fi

getinfo=$(amixer -c $sound_card_number get 'Auto-Mute Mode' | grep "Item0" | awk '{print $2}')

if [[ "$getinfo" == "'Disabled'" ]]
then
    amixer -c $sound_card_number set 'Auto-Mute Mode' Enabled
    pactl set-sink-port $sink_port analog-output-headphones
    clear
    echo -e "\033[1;31m\tHeadphone Mode \033[0m"

elif [[ "$getinfo" == "'Enabled'" ]]
then
    amixer -c $sound_card_number set 'Auto-Mute Mode' Disabled
    pactl set-sink-port $sink_port analog-output-lineout
    clear
    echo -e "\033[1;31m\tSpeaker Mode \033[0m"
fi
