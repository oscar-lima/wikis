Youbot navigation commands
==========================

update repository:

		cd ~/ros_ws/at_work_catkin_ws/src/mas_industrial_robotics
		./repository.debs

Real robot commands
===================

[TELEOP] move real youbot:

		roslaunch mir_bringup robot.launch
		roslaunch mir_teleop teleop_joypad.launch (this should launch automatically)

[NAV] to navigate the real youbot: (replace omni->diff to change mode)

		roslaunch mir_bringup robot.launch
		roslaunch mir_2dnav 2dnav_omni.launch
		rosrun rviz rviz

[SLAM] to map with slam on the real robot:

		roslaunch mir_bringup robot.launch
		roslaunch mir_teleop teleop_keyboard.launch
		roslaunch mir_2dslam 2dslam.launch
		rosrun rviz rviz
		rosrun map_server map_saver (map will be saved in current location)

Simulation commands
===================

[TELEOP] move youbot on simulation:

		roslaunch mir_bringup_sim robot.launch
		rosrun gazebo_ros gzclient (this should launch automatically)
		roslaunch mir_teleop teleop_joypad.launch (this should launch automatically)
		rosrun rviz rviz

[NAV] to navigate the youbot on simulation: (replace omni->diff to change mode)

		roslaunch mir_bringup_sim robot.launch
		rosrun gazebo_ros gzclient
		roslaunch mir_2dnav 2dnav_omni.launch
		rosrun rviz rviz

[SLAM] to map with slam on simulation:

		roslaunch mir_bringup_sim robot.launch
		rosrun gazebo_ros gzclient (this should launch automatically)
		roslaunch mir_2dslam 2dslam.launch
		roslaunch mir_teleop teleop_keyboard.launch
		rosrun rviz rviz