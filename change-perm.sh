#! /usr/bin/env bash

sudo df -H &&

echo -e "\nExample of USB Drive : /dev/sdb1"
echo -e "If you don't see the drive you want, it probably isn't mounted already."
echo -e "So, don't run the script and look at your disk utility."
echo -ne "Which drive : "
read drive

echo -e "\nExample of Mount Point Folder: USB STICK"
echo -ne "Mount point name : "
read mountPoint

echo -e "Example of file type : ntfs, vfat, ext4"
echo -ne "Drive file type : "
read fileType

if [[ ! $drive || ! $mountPoint || ! $fileType ]]; then
  echo -e "\nYou need to fill out those questions !!"
  return
fi

echo -e "\n"

mkdir -p "/media/$USER/$mountPoint" &&

sudo umount $drive &&

sudo mount -t $fileType -o rw,exec,uid=1000,gid=1000,umask=022 $drive "/media/$USER/$mountPoint" &&
