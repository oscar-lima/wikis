move arm with moveit
====================

This wiki will help you to move the arm with move it.

First thing you need to do is figure out which arm and pre-recorded poses are available, this depends
on how is configured the arm in moveit and which poses have been added to srdf file.

1. open youbot srdf file

		cd ~/hydro/src/mas_industrial_robotics/mir_manipulation/mir_moveit_youbot_brsu_1/config
		cat youbot.srdf

2. launch the following components

        roscore
        bringup             (roslaunch mir_bringup robot.launch)
        moveit              (roslaunch mir_moveit_youbot_brsu_3 move_group.launch)
        moveit commander    (rosrun moveit_commander moveit_commander_cmdline.py

3. on moveit commander terminal type:

        use arm_1
        go candle
        go folded
        go pre_grasp
        go to_my_awesome_prerecorded_pose
        
4. Done!! by now youbot arm should be able to move to your pre recorded poses