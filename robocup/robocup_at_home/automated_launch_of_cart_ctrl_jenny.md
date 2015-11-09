Jenny cartesian control
=======================

This wiki describes how to automate the process of opening terminals doing ssh into the robot launching some nodes
and waiting for some fixed time to launch other components, all this in an automated way.

1. open terminator and split your windows as many as you like

2. rigth click on terminator and go to preferences

3. go to layouts, click add, give a name for your layout

4. on the name column, select each of your terminals and fill up the custom command box with the commands provided in 5.

5. custom jenny commands to execute automated launching rutines with terminator

#roscore
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && roscore && echo "roscore" && exec bash'

#bringup
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && sleep 1 && roslaunch mdr_bringup robot.launch && echo "bringup" && exec bash'

#arm_bringup
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && sleep 45 && roslaunch mdr_lwr lwr.launch && echo "arm_bringup" && exec bash'

#move group moveit
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && sleep 50 && roslaunch mdr_moveit_cob move_group.launch && echo "moveit" && exec bash'

#moveit commander
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && sleep 65 && rosrun moveit_commander moveit_commander_cmdline.py && echo "commander" && exec bash'

#arm cartesian control
ssh -Xt oscar@192.168.1.101 'source ~/scripts/permanent.sh && sleep 65 && roslaunch mdr_arm_cartesian_control cob3.launch && echo "cartesian" && exec bash'

#dashboard (launched in local pc)
sleep 60 && export ROS_MASTER_URI=http://192.168.1.101:11311 && roslaunch mdr_bringup dashboard.launch && echo "dashboard" && exec bash

#3d connexion mouse
sleep 55 && export ROS_MASTER_URI=http://192.168.1.101:11311 && roslaunch emorobot_bringup cob.launch && echo "3dmouse" && exec bash

#rqt_gui
sleep 70 && export ROS_MASTER_URI=http://192.168.1.101:11311 && rosrun rqt_gui rqt_gui && echo "rqt_gui" && exec bash

6. open your terminator profile by executing:

        terminator -l my_profile_name
        
7. Done! now terminator will open crazily with many windows and each window is going to do ssh into jenny (or other robot) and will launch
    several processes accordingly