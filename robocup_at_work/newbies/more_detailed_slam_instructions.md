Map creation with SLAM
======================

Launch driver on the real robot:

		roslaunch mir_bringup robot.launch

On simulation (launch simulated driver):

		roslaunch mir_bringup_sim robot.launch

Launch Slam:

		roslaunch mir_2dslam 2dslam.launch

Run gazebo and rviz:
		
		rosrun gazebo_ros gzclient
		rosrun rviz rviz

To move the robot with keyboard:

		roslaunch mir_teleop teleop_keyboard.launch

To move the robot with joypad:

		roslaunch mir_teleop teleop_joypad.launch

You can configure rviz the same way as with navigation:

		Select:

		global options -> set the fixed frame to -> map

		Add visualization (expand and select topic):

		LaserScan -> /scan_front
		LaserScan -> /scan_rear
		Map -> /map
		Path -> /move_base/DWAPlannerROS/global_plan
		Path -> /move_base/DWAPPlannerROS/local_plan

To save the map:

		rosrun map_server map_saver -f ~/ros_ws/at_work/src/mas_common_robotics/mcr_environments/mcr_default_env_config/brsu-c025/map_name