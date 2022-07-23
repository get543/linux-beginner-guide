#!/bin/bash

# text colour
BRed='\033[1;31m'
Color_Off='\033[0m'

echo  "---------------------------------------------------------"
echo  "|	No	|	Option										"
echo  "---------------------------------------------------------"
echo  "|	1.	| 	Download A Video							"
echo  "|	2. 	|	Download A Music Playlist Video				"
echo  "|	3. 	|	Download One Music Video					"
echo  "---------------------------------------------------------"
echo -ne "${BRed}Choose number 1 or 2 or 3 ?${Color_Off} "
read option

echo -ne "\n${BRed}Link :${Color_Off} "
read link

cd ~/Downloads

if [ "$option" = 1 ]
then
	echo -ne "
	---------------------------------------------------------------------------------------------
				Automated YouTube Downloader Script Using YT-DLP
	---------------------------------------------------------------------------------------------
		--> The best 1080p 'video only' and the best 'audio only' merged <--
	\n"

	yt-dlp -F $link
	yt-dlp -S "res:1080,ext" -f "bv*+ba/b" $link -o "%(title)s.%(ext)s"
fi

# For Downloading Music
if [ "$option" = 2  ]
then
	echo -ne "
	---------------------------------------------------------------------------------------------
				Automated YouTube Downloader Script Using YT-DLP
	---------------------------------------------------------------------------------------------
		--> Download The best 'audio only' format (.m4a) Into A Separate Directory <--
	\n"

	yt-dlp -f ba[ext=m4a] -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$link"

elif [ "$option" = 3 ]
then
	echo -ne "
	---------------------------------------------------------------------------------------------
				Automated YouTube Downloader Script Using YT-DLP
	---------------------------------------------------------------------------------------------
		--> Download The Best 'audio only' format (.m4a) <--
	\n"

	yt-dlp -f ba[ext=m4a] -o "%(title)s.%(ext)s" "$link"

fi
