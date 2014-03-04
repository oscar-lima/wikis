Youbot ethercat connection
==========================

This tutorial describes how to connect to the youbot via ethercat

Set a static ip adress:

		click on manage connections
		wired
		add -> Wired
		give a connection name (i.e. youbot_ethercat)
		select method -> manual
		Fill in "ip adress" with any ip (i.e. 192.168.1.9)
		Fill "subnet mask" with 255.255.255.0
		click ok
		
Setup the youbot:

		connect youbot to the power supply
		hold on ON/OFF button for 2 seconds then release
		hold on ON/OFF button and release after seeing "motor on"
		
Connect an ethernet cable from you computer to the youbot arm/base ethercat port

Connect to the youbot_ethercat lan network (created on previous step)

Give permission to run driver node as sudo: 

(NOTE: This step will be automatically performed by the ./repositorydebs instruction, for the at work hbrsu team)

		cd ~/hydro/devel/lib
		sudo setcap cap_net_raw+ep youbot_driver_ros_interface

Run the robot initialization:

		roslaunch youbot_driver_ros_interface youbot_driver.launch

Done, the robot should move now to the hardware limits
