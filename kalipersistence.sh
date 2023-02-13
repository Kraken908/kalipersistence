#sb=/dev/sdb
#kali@kali:~$
#kali@kali:~$ sudo fdisk $usb <<< $(printf "n\np\n\n\n\nw")
#When fdisk completes, the new partition should have been created at /dev/sdb3; again, this can be verified with the command lsblk.

#Next, create an ext4 file system in the partition and label it persistence.
#kali@kali:~$ usb=/dev/sdb
#kali@kali:~$
#kali@kali:~$ sudo mkfs.ext4 -L persistence ${usb}3
#Create a mount point, mount the new partition there, and then create the configuration file to enable persistence. Finally, unmount the partition.
#kali@kali:~$ usb=/dev/sdb
#kali@kali:~$
#kali@kali:~$ sudo mkdir -p /mnt/my_usb
#kali@kali:~$ sudo mount ${usb}3 /mnt/my_usb
#kali@kali:~$ echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
#kali@kali:~$ sudo umount ${usb}3
