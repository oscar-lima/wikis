#greeting
echo Robocup!!!

#source
source ~/ros_ws/robocup/devel/setup.bash
source ~/scripts/ros-common.sh

#select a robot
#export ROBOT=youbot-brsu-1
export ROBOT=youbot-brsu-2
#export ROBOT=youbot-brsu-3
#export ROBOT=youbot-brsu-4

#select environment
export ROBOT_ENV=brsu-c025
#export ROBOT_ENV=brsu-c069
#export ROBOT_ENV=empty-world
#export ROBOT_ENV=brazil-2014

#ssh
alias yb1='ssh -X oscar@youbot-brsu-1-pc1'
alias yb2='ssh -X oscar@youbot-brsu-2-pc1'
alias yb3='ssh -X oscar@youbot-brsu-3-pc1'
alias yb4='ssh -X oscar@youbot-brsu-4-pc1'

#ROS MASTER URI
alias export_yb1='export ROS_MASTER_URI=http://youbot-brsu-1-pc1:11311'
alias export_yb2='export ROS_MASTER_URI=http://youbot-brsu-2-pc1:11311'
alias export_yb3='export ROS_MASTER_URI=http://youbot-brsu-3-pc1:11311'
alias export_yb4='export ROS_MASTER_URI=http://youbot-brsu-4-pc1:11311'

#alias
alias bringup='roslaunch mir_bringup robot.launch'
alias bringup_sim='roslaunch mir_bringup_sim robot.launch'
alias dwa='roslaunch mir_2dnav 2dnav_dwa.launch'
alias gazebo='rosrun gazebo_ros gzclient'
