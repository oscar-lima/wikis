no gui in ubuntu
================

This tutorial helps for not showing gui environment on ubuntu pc on startup
This can be helpful when having a robot with pc but no monitor, by setting
the gui to not work at all it will save some resources on the host pc

Full information can be found on :

http://www.htpcbeginner.com/force-ubuntu-boot-into-terminal/

1. change file fro grub configuration 

		sudo nano /etc/default/grub

2. change the following line:

		GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

for:

		GRUB_CMDLINE_LINUX_DEFAULT="text"

3. update grub

		sudo update-grub

Done!

By now you should be able to start your ubuntu system withou gui

		
