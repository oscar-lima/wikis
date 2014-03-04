Joypad configuration
====================

This wiki solves the problem that arises for some computers in which the internal laptop accelerometer 
(used for hdd fall data protection) is been recognized as joypad input device. For that the solution is to 
remap a joypad parameter from js0 to js1 as described in this document.

Documentation available at:

		http://wiki.ros.org/joy/Tutorials/ConfiguringALinuxJoystick

0. Diagnostic:

With the joypad unconnected check if your laptop is detecting the accelerometer as joypad input:

		ls /dev/input/js0
		
If the output is:

		/dev/input/js0

then your computer is recognizing some input device as js0, most probably the internal accelerometer in case no other 
usb device is being plugged in.

Since the joypad default configuration needs the joypad to be js0, then this represents a conflict.

Solution:

run:

		ls /dev/input/js*

Connect joypad usb dongle to the usb port of your computer.

Run the command again and identify the name for your usb joypad dongle device.

Remap to this new string value (most likely js1) using the following instructions:


1. go to this location:

		cd ~/ros_ws/at_work/src/mas_industrial_robotics/mir_robots/mir_hardware_config/youbot-brsu-2/config
		
NOTE: youbot-brsu-2 can and should be replaced accordingly to the environment variable ROBOT which was setted on the
bashrc or current terminal with the followinf command:

		export ROBOT=youbot-brsu-2
		
2. open and edit joy.yaml file:

		gedit joy.yaml
		
Replace this line:
		
		dev: /dev/input/js0

for:

		dev: /dev/input/js1
		
Done!

Now your computer should be able to use the joypad and the following command to launch it will not crash:

		roslaunch mir_teleop teleop_joypad.launch
		
The device will appear in the following location:

		ls /dev/input/js1