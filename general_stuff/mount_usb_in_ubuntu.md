mount USB stick
===============

This wiki helps you to mount your USB stick somewhere in your hardrive in ubuntu.

Usually it mounts under /media/USB_STICK_NAME

but sometimes it does not, so this wiki will help you for that case in which does not mount automatically.

Documentation can be found on this link:

		http://askubuntu.com/questions/311772/how-do-i-know-the-device-path-to-an-usb-stick

1. plug in your usb stick

2. identify the name of your usb stick

		lsblk

output similar to this:

		NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
		sda      8:0    0 111.8G  0 disk 
		└─sda1   8:1    0 111.8G  0 part /
		sdb      8:16   0  29.8G  0 disk 
		└─sdb1   8:17   0  29.8G  0 part

now by size identify your device, for the example our device is "sdb1"

3. you can double check that your device is still there by doing 

		ls /dev/sdb*

4. Create the USB folder name in which you want to mount your device

		mkdir ~/USB_STICK

5. Mount usb stick in that location, replace ? with your device number, example b1

		sudo mount /dev/sd? ~/USB_STICK

for our case example:

		sudo mount /dev/sdb1 ~/USB_STICK

Done!

Now you should be able to acces your usb stick under ~/USB_STICK