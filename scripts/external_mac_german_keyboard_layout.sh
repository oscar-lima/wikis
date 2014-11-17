#!/bin/sh

#this scripts allows to connect a external keyboard to a macbook and have a different
#keyboard layout for it

#giving time for the keyboard to mount
sleep 1

#script to determine the device id of the mac keyboard
devid_mix=$(xinput -list | grep -i 'Apple Keyboard' | cut -d"=" -f2 | cut -d"[" -f1)
devid1=$(echo $devid_mix | cut -d" " -f1)
devid2=$(echo $devid_mix | cut -d" " -f2)
#echo devid1=$devid1 devid2=$devid2

echo 'executing command : setxkbmap -device' $devid1 '-layout de -variant mac_nodeadkeys'
echo 'executing command : setxkbmap -device' $devid2 '-layout de -variant mac_nodeadkeys'

setxkbmap -device $devid1 -layout de -variant mac_nodeadkeys
setxkbmap -device $devid2 -layout de -variant mac_nodeadkeys

# wiki, how this was done?

# original terminal command:
# 	xinput -list | grep -i 'Apple Keyboard'

# cut usage (to extract device id, integer number):
# information taken from: http://ubuntuforums.org/showthread.php?t=1433936
# if you wanted to extract out "seven", you'd cut based on ":" and ask for field number 2 since 
# everything before the ":" is one field and everything after it is another field. However, 
# as you'll quickly realize field 2 will give you "seven eight" and so you'll need to pass that 
# to a new cut command with " " as delimiter and ask for field 1.
# 	example:
# 	line="one two three four-five six:seven eight"
# 	echo $line | cut -d":" -f2 | cut -d" " -f1

# command to change external keyboard layout
# 	setxkbmap -device 15 -layout de -variant mac_nodeadkeys
#	where 15 has to be replaced with the device id of the keyboard obtained in the previous step
