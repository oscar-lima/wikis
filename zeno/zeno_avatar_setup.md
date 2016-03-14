Zeno Avatar simulation setup
============================

This wiki will help you to install zeno simulator.

Documentation available at:

		http://www.hrkind.com/docs/standalone_avatar.html

1. Install maven, Qpid server and jdk v6 (java)

Install maven:

		sudo apt-get install maven2

Install qpid server:

		mkdir ~/programs
		cd ~/programs
		wget archive.apache.org/dist/qpid/0.16/qpid-java-broker-0.16.tar.gz
		tar xvzf qpid-java-broker-0.16.tar.gz
		echo "export PATH=$PATH:~/programs/qpid-broker-0.16/bin" >> ~/.bashrc
		source ~/.bashrc

Test qpid-server

		qpid-server

Install java jdk, jre v6 update 45

		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update
		sudo apt-get -y install oracle-java6-installer

2. Download and run avatar robokind software:

Download the avatar via ftp from the followgin website:

		ftp://robokind-dl.com/hrk_standalone_avatar/src/hrk_standalone_avatar_src_20130430_015_02.zip

It will ask for credentials:

		username: your_username (you need to purchase a zeno to have this)
		password: your_password (you need to purchase a zeno to have this)

Extract the folder, you should see now something like this:

		~/hrk_standalone_avatar_src_20130430_015_02

Modify the mvn settings.xml file to include the zeno proper server:

		gedit /etc/maven2/settings.xml

Add this lines in between servers tag:

		<server>
			<id>hrk_commercial</id>
			<!--id>ftp://robokind-dl.com</id-->
			<username>your_username</username>
			<password>your_password</password>
		</server>

run the avatar from the proper location (first time you must be connected to the internet):

		cd ~/Documents/emo_robot/remote_control_of_zeno/avatar/hrk_standalone_avatar_src_20130430_015_02
		mvn -Prun-on-felix package antrun:run

Now you should be able to see Zeno robot running on simulation.


QPid installation detailed instructions
=======================================

download Qpid apache server from the following website:

		archive.apache.org/dist/qpid/0.16/qpid-java-broker-0.16.tar.gz

extract it (replace user with your username, or a more appropiate path):

		tar xvzf qpid-java-broker-0.16.tar.gz -C /home/user/...

Modify you PATH environment variable to point to the direction of the bin Qpid folder:

		export PATH=$PATH:~/.../qpid-broker-0.16/bin/

You might want to add this last command to your bashrc for further use.

Run by typing in the terminal the following command:

		qpid-server
