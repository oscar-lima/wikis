set up custom ip adress for referee box
=======================================

This wiki explains how to set the parameters in the parameter server (ROS) 
in order to configure a custom ip adress for the referee box in robocup
at work.

1. open a roscore

2. set the parameters, they will only live as long as the roscore lives
if you kill the roscore the parameters will die as well.

		rosparam set /refbox_ip 192.168.1.217
		rosparam set /refbox_port 11111
		rosparam set /refbox_team_name b-it-bots

3. Done!

Now you should be able to communicate with the referee box

Troubleshooting:

In case you have further problems of communication with refbox check the following:

A. do ifconfig on refbox pc and check the ip adress there, put that value
iside the /home/atwork/RoboCupAtWorkRefereeBox/config/myConfigFile.txt

B. Also put the same value in parameter refbox_ip

C. check portname in config file as well

D. ping the refbox by ip and name from the other machine

F. ping the other machine from the refbox

