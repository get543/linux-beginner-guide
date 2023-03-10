# !/bin/bash

if [ "$1" = "on" ]
then
	pactl load-module module-loopback latency_msec=1
elif [ "$1" = "off" ]
then
	pactl unload-module module-loopback
else
	echo "./loopback.sh on"
	echo "./loopback.sh off"
fi
