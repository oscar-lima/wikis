Zeno Avatar simulation installation
===================================

Documentation available at:

		http://www.hrkind.com/docs/standalone_avatar.html

Installation
============

Install maven, Qpid and jdk v6 as instructed in the website provided in the documentation link. 

(only Qpid detailed installation instructions are provided at the bottom of this document)

Download the avatar via ftp from the followgin website:

		ftp://robokind-dl.com/hrk_standalone_avatar/src/hrk_standalone_avatar_src_20130430_015_02.zip

it will ask for credentials you can use this ones from BRSU:

		username: brsu@robokind-dl.com
		password: your_password

Extract the folder, you should see now something like this:

		~/hrk_standalone_avatar_src_20130430_015_02

modify the mvn settings.xml file to include the zeno proper server:

		kate /usr/local/apache-maven/apache-maven-3.1.1/conf/settings.xml

add this lines:

		<server>
			<id>hrk_commercial</id>
			<!--id>ftp://robokind-dl.com</id-->
            <username>brsu@robokind-dl.com</username>
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
