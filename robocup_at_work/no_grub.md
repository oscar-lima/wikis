no grub
=======

The following tutorial arises from the need of a computer to not get stucked
in the grub during boot. For this we completely skip the grub menu
and do not show it at all.

Documentation on how to do this can be found on:

		http://askubuntu.com/questions/148095/how-do-i-set-the-grub-timeout-and-the-grub-default-boot-entry

1. Edit the grub file with nano or gedit

		sudo nano /etc/default/grub

2. Change the hidden timeout to false

locate the following line:

		GRUB_HIDDEN_TIMEOUT_QUIET=true

change it to:

		GRUB_HIDDEN_TIMEOUT_QUIET=false

Done!

reboot and now your ubuntu system will not show the grub menu, and will
load ubuntu automatically
