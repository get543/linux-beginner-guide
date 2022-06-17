#!/bin/bash

# text colour
BRed='\033[1;31m'
Color_Off='\033[0m'

cd ~/Downloads

if [ "$#" -lt "1" ]
then
	echo -e "Wrong! Like This: ${BRed}./ytdlp.sh https://youtu.be/dQw4w9WgXcQ${Color_Off} \n"
	exit 1
fi

if [ "$1" ]
then
	echo -ne "
	---------------------------------------------------------------------------------------------
				Automated YouTube Downloader Script Using YT-DLP
	---------------------------------------------------------------------------------------------
		--> The best 1080p 'video only' and the best 'audio only' merged <--
	\n"

	yt-dlp -F $1
	yt-dlp -S "res:1080,ext" -f "bv*+ba/b" $1 -o "%(title)s.%(ext)s"
fi
