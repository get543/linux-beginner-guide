#! /usr/bin/env bash

red="\033[1;31m"
colour_off="\033[0m"

# setting port to use what currently being use (ALC887-VD = my usual soundcard)
active_sink_port=$(pacmd list-sinks | grep "* index:" | awk '{print $3}')
active_soundcard_number=$(aplay --list-devices | grep ALC887-VD | awk '{print $2}' | tr -d ':')

# get automute info
get_info=$(amixer -c $active_soundcard_number get 'Auto-Mute Mode' | grep "Item0" | awk '{print $2}')

headphone_mode() {
  # set automute to enabled
  amixer -c $active_soundcard_number set 'Auto-Mute Mode' Enabled

  # change output to headphones
  pactl set-sink-port $active_sink_port analog-output-headphones

  clear

  # display status
  echo -e "${red}\tHeadphone Mode ${colour_off}"
  notify-send --urgency=low "Output Change to \"Headphone Mode\""
}

speaker_mode() {
  # set automute to disabled
  amixer -c $active_soundcard_number set 'Auto-Mute Mode' Disabled

  # set output to speakers
  pactl set-sink-port $active_sink_port analog-output-lineout

  clear

  # display status
  echo -e "${red}\tSpeaker Mode ${colour_off}"
  notify-send --urgency=low "Output Change to \"Speaker Mode\""
}


# if automute is disabled
if [[ "$get_info" = "'Disabled'" ]]
then
  headphone_mode

# if automute is enabled
elif [[ "$get_info" = "'Enabled'" ]]
then
  speaker_mode
fi
