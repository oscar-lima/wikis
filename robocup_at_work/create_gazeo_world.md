Creating your own gazebo at work scenario
=========================================

This wiki will help you to modify gazebo ros simulation environment.

This tutorial asumes you already have a urdf model of your world, if not then you can copy one as 
template and modify or create a new one using blender, google sketchup or other cad software.

Although this tutorial does not explain this process.

1. Modify your robot env variable in bashrc or terminal:

		export ROBOT_ENV=foo-world

2. Create your own world launch file:

Go to this location

		cd ~/ros_ws/at_work/src/mas_common_robotics/mcr_environments/mcr_gazebo_worlds/ros/launch

Create your own launch file:

		touch foo-world.launch

		or better, use c025 as template ;)

		cp brsu-c025.launch foo-world.launch

4. Edit your launch file:

		geany foo-world.launch

find this line:

		<arg name="robot_env" default="brsu-c025" />
		
modify default value from  "brsu-c025" to "foo-world" as follows:

		<arg name="robot_env" default="foo-world" />

5. Add urdf model of your environment:

go to this location:

		cd ~/ros_ws/at_work/src/mas_common_robotics/mcr_environments/mcr_gazebo_worlds/common/worlds

insert your foo urdf model of your world

		nautilus .
		
copy in this location your urdf world with the following name:

		foo-world.urdf.xacro

6. Ready!, now you can brinup your robot and your world should be loaded in gazebo

		roslaunch mir_bringup_sim robot.launch


Troubleshooting
===============

Gazebo process is dying often and does not show:

This is common problem for gazebo or rviz to die often, please relaunch as follows:

		rosrun gazebo_ros gzclient