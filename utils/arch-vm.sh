#!/bin/bash

cd ~/VM/archlinux-latest

qemu-system-x86_64 -enable-kvm -show-cursor ./archlinux-2022.04.05-x86_64.iso -boot menu=on -drive file=Image.img -m 2G -smp $(nproc) -cpu host -vga virtio -display gtk,gl=on
