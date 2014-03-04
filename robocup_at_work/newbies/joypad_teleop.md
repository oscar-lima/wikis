Moving youbot with remote control
=================================

Launch the youbot driver:

		roslaunch mir_bringup robot.launch

Launch teleop joypad nodes:

		roslaunch mir_teleop teleop_joypad.launch

Ready, now take a look at "joypad configuration" sheet for joypad usage, this reference sheet is normally

located somewhere in the lab (look in the shelfs).

NOTE: You can get arm joint values by pressing the top left button of the joypad (see printout of the joypad configuration)

this is useful to now the current 5 joint values of the arm, the value will be expressed in radians.


Additionally if you want to test
================================

To hear the joypad topic:

		rostopic echo /joy

To get the joypad parameter:

		rosparam get /joy_node/dev

To set the parameter: (js0 can be interpreted as you computer accelerometer, Mac case)

		rosparam set /joy_node/dev /dev/input/js1

To get a list of parameters:

		rosparam list

Configure parameters:

		roslaunch mir_default_robot_config upload_param.launch

This configuration is being loaded from joy.yaml configuration file which depends upon the robot number,
you can find it in the following location:

		~/ros_ws/at_work/src/mas_industrial_robotics/mir_robots/mir_hardware_config/youbot-brsu-4/config/joy.yaml