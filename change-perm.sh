#! /usr/bin/env bash

sudo df -H &&

echo -e "\nExample of USB Drive : /dev/sdb1"
echo -ne "Which drive : "
read drive

echo -e "\nExample of Mount Point Folder: USB STICK"
echo -ne "Mount point name : "
read mountPoint

echo -e "\n"

mkdir -vp "/media/$USER/$mountPoint"

sudo umount $drive &&

sudo mount -t vfat -o rw,exec,uid=1000,gid=1000,umask=022 $drive "/media/$USER/$mountPoint" &&

echo -e "Mounted $drive drive at /media/$USER/$mountPoint"
