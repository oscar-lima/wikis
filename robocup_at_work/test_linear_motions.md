test linear motions
===================

This wiki helps to test linear motion component written by shehzad for robocup at work scenario

1. launch the following nodes on the robot:

		roscore
		roslaunch mir_bringup robot.launch
		roslaunch /home/oscar/hydro/src/mas_industrial_robotics/mir_manipulation/mir_arm_relative_motion_control/ros/launch/youbot-brsu-1/arm_relative_motion_controller.launch

2. go to pre_grasp

		roslaunch mir_moveit_youbot_brsu_1 move_group.launch
		rosrun moveit_commander moveit_commander_cmdline.py

on previous terminal type:
		
		use arm_1
		go pre_grasp

3. setup ros parameters for the linear motion:

		#distance, modify to reduce the distance of the linear motion
		rosparam set /arm_relative_motion_controller/platformsurface_wrt_baselink 0.158
		rosparam set /arm_relative_motion_controller/relative_distance_x -0.05

4. publish the e_start command

		rostopic pub /arm_relative_motion_controller/event_in std_msgs/String "data: 'e_start'"