EMO-ROBOT
=========

Zeno setup.

Documentation available at:

		http://www.hrkind.com/docs/linux_platform_setup.html#jdk_linux

Moving zeno for the firs time
=============================

1. Install java 6 update 45:

		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update
		sudo apt-get -y install oracle-java6-installer

2. Install zeno roboworkshop interface:

It is inside the robot you can copy from there.

Open roboworkshop:

		cd ~/zeno/robokindcontroller/bin
		./robokindcontroller

3. Check zeno connectivity

Connect zeno to the power supply and turn it on. Wait for initialization (zeno will tell his ip address when done)

connect to the same zeno wifi ("emorobot" is the name of the wifi net)

		password : 17845540

check connection with zeno robot:

		ping zeno

4. Learn to use roboworkshop

Go to the following website:

		https://docs.google.com/folderview?pli=1&id=0B98R6jYfFO4GcUhuOEdpOGVmN28

Download and read the following document starting from page 7

		ReadMeLinux.pdf   

Test teena animation scripts:

		cd ~/zeno
		git clone https://<bitbucket_user_name>@bitbucket.org/teenahassan/zeno_animation_scripts.git

Open roboworkshop, click on file, open animation.

A window will appear asking for the animation file, search for desired script and click ok, then run.

By now you should be able to run teena animation scripts and zeno should move.

By checking the mentioned document you should also be able to create your own zeno animations and move the robot.


Making custom Zeno programs with eclipse
========================================

Clone zeno-command-center repo (bitbucket):

		cd installation_location
		git clone git@bitbucket.org:ozkrelo/zeno-command-center.git

install maven2:

		sudo apt-get install maven2
		
create the eclipse project:
		
		cd .../zeno-command-center
		mvn eclipse:eclipse
		
install eclipse kepler:

		http://www.eclipse.org/kepler/
		
import project:

		open eclipse
		file -> import
		select .../zeno-command-center

you might have an import error (M2_REPO), try this:

		http://el.web.id/unbound-classpath-variable-m2_repo-in-eclipse-135

		
Done! By now your project should run and show the zeno command center gui

=============done===============
		
install groovy 2.2:

		http://groovy.codehaus.org/Download#Download-GVMtheGroovyenVironmentManager
		
add this lines into xml file between dependencies

		 <dependency> <groupId>org.codehaus.groovy</groupId> <artifactId>groovy-all</artifactId> <version>2.1.8</version> </dependency> <dependency> <groupId>com.jgoodies</groupId> <artifactId>forms</artifactId> <version>1.2.0</version> </dependency>
		 
close project and remove

do the mvn thing again

import into eclipse

clone zeno_animation_scripts from teena repo, this step you should already complete in "testing the robot" if not then do

		cd ~/zeno
		git clone https://<bitbucket_user_name>@bitbucket.org/teenahassan/zeno_animation_scripts.git

On eclipse package explorer expand "src/main/java" and then "expand hbrs.emorobot package"

double click on Main.java to open it

fix the hardcoded paths

there are two of them

fixing class problem:

click on run -> run configurations

you should have "hbrs.emorobot.Main" in Main class

Miscellaneous commands
======================
		
To fix: not running executable ./

		chmod 0766 robokindcontroller
		./robokindcontroller
		
SSH to zeno:

		ssh fit@zeno
		pass: fit
		
Online documentation
====================

oficial customer zeno webpage:

		http://www.hrkind.com/

customer zeno manuals:

		https://docs.google.com/folderview?pli=1&id=0B98R6jYfFO4GcUhuOEdpOGVmN28
		
Open source wiki nice page:
		
		https://wiki.dcs.shef.ac.uk/Main/ZenoRobot
		
Troubleshooting
===============

		java.lang.ClassNotFoundException: org.slf4j.LoggerFactory error:

Probably you have installed java 7, you need to install java 6.

Follow the steps described in this webpage to help you installing java 6 in your system.

		http://hendrelouw73.wordpress.com/2013/05/07/how-to-install-oracle-java-6-update-45-on-ubuntu-12-10-linux/