Connecting directly to youbot arm without base
==============================================

This wiki will help you to connect and move directly the youbot arm without the base.

1. hardware setup

a) Connect power supply directly to the arm
b) Connect ethernet cable to the left 

		cd ~/ros_ws/rockin/src/youbot_driver/config
		gedit youbot-manipulator.cfg

2. Change the joints:

remove the following lines

		-ManipulatorJoint1 = 5
		-ManipulatorJoint2 = 6
		-ManipulatorJoint3 = 7
		-ManipulatorJoint4 = 8
		-ManipulatorJoint5 = 9

add the following lines

		+ManipulatorJoint1 = 1
		+ManipulatorJoint2 = 2
		+ManipulatorJoint3 = 3
		+ManipulatorJoint4 = 4
		+ManipulatorJoint5 = 5

3. Launch bringup (roslaunch mir_bringup robot.launch)

Done!!

Now you should be able to connect to the arm and move it without base