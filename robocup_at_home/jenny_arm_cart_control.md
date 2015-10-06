launch jenny arm in cartesian mode
==================================

This wiki helps for launhing jenny arm in cartesian control mode with the 3d mouse

0. initialize jenny

a) connect jenny to the power supply

		disconnect blue and red cable from power supply
		connect non connected red and blue cable to jenny
		connect jenny power supply to the power socket
		turn all knobs fully counterclockwise (all 4 knobs)
		turn a bit the knobs (5 degrees) clockwise
		check for all red led's on power supply must be off
		increase voltage (the most left knob) to 55.5 volts
		again check for all red led's on power supply must be off
		by having current on 0 amps (or very small value) connect jenny red and blue cable to power supply
		increase current to maximum
		decrease voltage until red led goes off

b) turn on jenny

		turn clockwise jenny's key for 3 seconds -> now pcs and jenny should turn on and all fans start
		wait some time

c) release emergency stops on jenny (3 emergency stops)

		release left lateral emergency stop (is a small red button on the side of jenny)
		release right lateral emenrgency stop (is a small red button on the side of jenny)
		**press and release external emergency stop control red button
		press and hold for 1 second black button which is at the right of the green external remote control button -> hear some click on jenny when releasing it
		turn jenny key clockwise for 2 seconds -> hear another more loud click on jenny, if many clicks then repeat procedure from **

1. bringup jenny and dashboard

		roslaunch mdr_bringup robot.launch
		roslaunch mdr_bringup dashboard.launch

2. initialize base and torso

Arm has not much reach actually, so in order to grasp things a combination of arm and base is needed.
Now that we explained the motivation for starting the base, initialize the base:

		press and hold joypad upper button (deadman button)
		press 10 button (the one on top of vibration button)
		
		torso init by gui dashboard

3. start the arm (telnet)

		emergency released
		telnet lbr-box
		terminal appears
		type in "<l"
		wait for "Stable State RUNNING reached !" message
		press emergency button
		wait for "0 to 1" console message
		release emergency button
		turn jenny key clockwise for 3-5 seconds then release
		wait for"1 to 0" console message

3.1 start lwr node

		roslaunch mdr_lwr lwr.launch
		#recover init arm_controller
		rosservice call /arm_controller/lwr_node/recover

2. launch move group

		roslaunch mdr_moveit_cob move_group.launch

3. launch moveit commander

		rosrun moveit_commander moveit_commander_cmdline.py
		use arm

go to required predefined poses (check "important_prerecorded_poses.txt" for more jenny arm poses):

		go pre_look_at_table
		go look_at_table
		go handover
		go prehandover

4. start cartesian control

	roslaunch mdr_arm_cartesian_control cob3.launch

5. launch emorobot 3d mouse components (3d nav mouse must be connected)

	roslaunch emorobot_bringup cob.launch

6. load jenny rqt plugin

	rosrun rqt_gui rqt_gui
	..load EmoRObot/Jenny plugin:
	(click on the menu "Plugins" then under "EmoRobot" and then "EmoRobot Jenny Plugin")
	-> load module
	-> to velocity (cart control)
	-> to position (moveit control)

10. Operation

a) bring tray up (optional)

b) bring the arm to "prehandover" prerecorded position

		#inside moveit commander terminal:
		use arm
		go prehandover
		go handover

c) switch between arm and base 3d mouse control

you can click on the rqt_gui between "Base Mode" and "Arm Mode"

or alternatively you can press the lateral buttons on the 3d mouse: (having the cable on the front side)

		left one for arm control
		right one for base control

you can also control the base with the joypad as well

d) open and close the gripper

check under sdh groupbox gui for the button which says cyl. close and cyl.open


Troubleshoot
============

a) arm does not move

-recover the arm: 

rosservice call /arm_controller/1wr_node/recover

b) base does not move

c) arm moves, but shakes and vibrates a lot while doing it

		controller was not initialized properly (not because of you but some error), just relaunch it:
		in telnet terminal: type reboot, wait for it to reboot
		in the worst case: switch on and off manually the telnet pc

terminator terminal arrange
===========================

roscore
roslaunch mdr_bringup robot.launch
roslaunch mdr_bringup dashboard.launch
telnet lbr-box

roslaunch mdr_lwr lwr.launch
rosservice call /arm_controller/lwr_node/recover
roslaunch mdr_moveit_cob move_group.launch
rosrun moveit_commander moveit_commander_cmdline.py

new tab:
roslaunch mdr_arm_cartesian_control cob3.launch
roslaunch emorobot_bringup cob.launch
rosrun rqt_gui rqt_gui

terminator automated operation
==============================
turn on key
check for 3 emergency stops to be released
wait until jenny computer is on (about 15 seconds)
-----
type jenny_cartesian (terminator -l jenny_cartesian)
wait 70 second until all nodes are launched
go to moveit commander terminal
be carefull to hear the arm clack, if not then initalize manually the arm (telnet)
use arm, go pregrasp, go prehandover, go handover
go to emorobot rqt_gui click:
 -> load module
 -> to velocity (to move with 3d mouse)
 -> to position (to move with moveit)
keep in mind that jenny dashboard columns arm settings, arm pose, and arm traj they all dont work

when shutting down:
go prehandover, go pregrasp, go folded
Done!