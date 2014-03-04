ROS NAVIGATION on groovy
========================

Launching raw_2dnav package
===========================

Launch the files:

		roslaunch raw_bringup_sim robot.launch
		
		roslaunch /home/oscar/at_work_ws/robocup-at-work/raw_navigation/raw_2dnav/ros/launch/sim/2dnav_sim.launch
		or:
		roslaunch raw_2dnav 2dnav_sim.launch

Run gazebo and rviz:

		rosrun gazebo gui
		rosrun rviz rviz

in global options set the fixed frame to /map

		
Praveen help
============

try the following commands:

		roscd raw_2dnav
		rosmake
		roscore
		roslaunch raw_2dnav 2dnav_sim.launch
		rosrun rviz rviz

Troubleshooting
===============
		
gksudo error (only for kde):

		export USE_NORMAL_SUDO=1
		sudo ls
