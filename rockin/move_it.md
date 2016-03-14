wiki move it
===========

This wiki will help to move the arm of the youbot using move it

Launch the following nodes:

		roscore
		bringup_sim
		rviz
		roslaunch mir_moveit_youbot_brsu_2 move_group.launch

for moving to predefined positions:

		rosrun moveit_commander moveit_commander_cmdline.py

run the following commands:

		use arm_1
		go home
		go pre_grasp
		go candle

for launching fake tf:

		rosrun fake_tf_pub fake_tf_pub

for hearing at transformations:

		rosrun tf tf_echo arm_link_0 gripper_finger_link_l

for testing shehzad script for going to cartesian pose with move it:

		rosrun mir_moveit_youbot_brsu_2 rockin_move_group.py

