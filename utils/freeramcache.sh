echo 3 > /proc/sys/vm/drop_caches &&
swapoff -a &&
sleep 2 &&
swapon -a &&
echo "Ram-cache and Swap has been cleared."
