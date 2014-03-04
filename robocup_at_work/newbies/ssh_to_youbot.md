Youbot ssh access
=================

This wiki describes how to access youbot computer trough the same wifi using ssh.

Documentation available at:

		http://support.suso.com/supki/SSH_Tutorial_for_Linux

0. Connect to the same network, must likely you will work with "youbot-developers" wifi network:

		password: area4251 or area5142

1. Run the command:

		ssh username@youbot-brsu-#-pc1

NOTES: 

- replace # with the youbot number 1-4 accordingly, youbot must be powered up and in the same network.

- username can be student, robocup or if you have an account then your username account.

2. Enter your password

Done, Now you should be remotely connected to the youbot computer and be able to execute commands from there.


Other useful related tips
=========================

A. Login without entering password

This section asumes you already generated ssh keys if not then go to the following website follow steps 1 and 2 only. 

		https://help.github.com/articles/generating-ssh-keys

1. copy your ssh keys into clipboard and paste the content of your key into the clipboard using the following instructions:

		sudo apt-get install xclip
		xclip -sel clip < ~/.ssh/id_rsa.pub

2. ssh into desired pc

		ssh user@youbot-brsu-2-pc1
		
NOTE: you need an account for that on the youbot, if you don't have, you can ask Fred for one

3. create authorized keys file

		nano ~/.ssh/authorized_keys

4. Paste the content of the clipboard there(ctrl + shift + v), save (ctrl + o, then enter) and close (ctrl + x)

5. Give proper permissions to the ssh folder and authorized keys file (current tests indicate this step is not needed)

		chmod 700 ~/.ssh
		chmod 600 ~/.ssh/authorized_keys

Done! now you should be able to log into youbot without entering password with the following command:

		ssh user@youbot-brsu-2-pc1

B. To open gui applications in client PC 

Example: gedit a file on youbot, but display in your PC

		ssh -X youbot-brsu-2-pc1

C. To tell your computer that the roscore is running on another PC and communicate accordingly trough

the network.

Example: run some nodes in one computer and other nodes in another computer which can fully communicate with each
other

Drawback: the wifi speed will not allow you to transfer heavy data over the net.

Usage:

1. set environment variable ROS_MASTER_URI to point to the PC in which the roscore is currently running:

		export ROS_MASTER_URI=http://youbot-brsu-2-pc1:11311

Done!, now in this terminal in which you executed the command the nodes will communicate with the roscore that is running

in another computer.


D. Remotely shut down the youbot computer: (requires sudo permission)

		sudo shutdown -h now

E. Default youbot ip address:

		192.168.#.55
		192.168.#.101


Example for youbot-4 and oscar account
======================================

1. Connect youbot to power supply, turn it on and wait until gets connected to the same network, also connect

your computer to the same network.

2. Check if youbot is responding:
		
		ping youbot-brsu-4-pc1

Should respond similar to this:
		
		PING youbot-brsu-4-pc1 (192.168.13.141) 56(84) bytes of data.
		64 bytes from youbot-brsu-4-pc1 (192.168.13.141): icmp_req=1 ttl=64 time=152 ms
		64 bytes from youbot-brsu-4-pc1 (192.168.13.141): icmp_req=2 ttl=64 time=2.05 ms
		64 bytes from youbot-brsu-4-pc1 (192.168.13.141): icmp_req=3 ttl=64 time=2.00 ms

If this is the case proceed to connect via ssh:

		ssh oscar@youbot-brsu-4-pc1
		#enter your password

Extra information (if needed)
=============================
		
ip address:

		192.168.4.55
		192.168.4.101