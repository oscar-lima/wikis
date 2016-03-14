Moving Zeno avatar
==================

This tutorial explains different ways to move zeno robot simulation

Moving Zeno avatar from RoboWorkshop
====================================

Open a terminal and launch the Qpid server:

		qpid-server

If this command doesn't work check the troubleshooting section at the end of this document.

in a new terminal run the avatar simulation environment:

		cd ~/Documents/emo_robot/remote_control_of_zeno/avatar/hrk_standalone_avatar_src_20130430_015_02
		mvn -Prun-on-felix package antrun:run

in another terminal run the RoboWorkshop java application:

		cd ~/.../zeno/robokindcontroller/bin
		./robokindcontroller

The following steps must be performed in RoboWorkshop java application:

		Go to "Tools" then select "Options" and click the option button "Manual Proxy Settings" then put 
		the ip adress of your computer or localhost, fill the port with the qpid provided value from the 
		previous step, then click ok.

		Then go again to "Tools" and then "Connect Remote Robot", fill with 'localhost' or the ip adress of your computer.

		Load an animation xml file (file->open animation) and click on 'play loop' symbol. 
		Click on stop for ending the animation. For some unknown reason if you attempt to play only one time 
		it will not work, only if you play in loop mode.

Now you should be able to see Zeno robot moving in the avatar simulator.


Moving Zeno robot from custom java app
======================================

This tutorial assumes you already have a java application capable to connect to the real robot.

Configure your java application to work with the avatar:

		Simply comment all lines of code related to zeno's ip address such as:
		
		//String ip = "zeno";
    	
    	//UserSettings.setSensorAddress(ip);
        //UserSettings.setAccelerometerAddress(ip);
        //UserSettings.setGyroscopeAddress(ip);
        //UserSettings.setCompassAddress(ip);
        //UserSettings.setRobotAddress(ip);
        //UserSettings.setSpeechAddress(ip);
        //UserSettings.setRobotId("myRobot");
        //UserSettings.setCameraAddress(ip);
        //UserSettings.setAnimationAddress(ip);
        //UserSettings.setCameraId("0");
        
        the first line of code you should have in this block is to attempt directly to connect to zeno robot:
        
        RemoteRobot robot = Robokind.connectRobot();
        
        done...

Launch the Qpid server:

		qpid-server

Launch the avatar application:

		cd ~/Documents/emo_robot/remote_control_of_zeno/avatar/hrk_standalone_avatar_src_20130430_015_02
		mvn -Prun-on-felix package antrun:run

run your java application.

The robot should be executing the given commands now.
		
Troubleshooting
===============

Qpid server, unknown command. Reason: you did't properly install Qpid server, check for the installation tutorial or fix the PATH environment variable to point to the direction of your Qpid bin files.

To do so, run the following terminal command, or add it to your bashrc

		export PATH=$PATH:~/Documents/emo_robot/remote_control_of_zeno/avatar/qpid-broker-0.16/bin/