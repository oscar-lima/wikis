dmp wiki
=========

a proper wiki is available under:

file:///home/oscar/ros_ws/robocup/src/mas_common_robotics/mcr_manipulation/mcr_trajectory_generation/README.md

do:

        roscd mcr_trajectory_generation
        firefox README.md

keep this proper wiki as master wiki, and if you want to continue with this info then do so. (not recommended)
        
make sure you have the code:

        roscd mas_common_robotics
        checkout the branch test_dmp in mas common robotics
        
compile

edit config file with motion primitives:
        
        cd /home/oscar/ros_ws/robocup/src/mas_common_robotics/mcr_manipulation/mcr_trajectory_generation/ros/config
        gedit task_space_examples.yaml

add your example as 7 dimensional poses x,y,z, + quaternion as pose python array

publish start pose:

start pose

rostopic pub -r 10 /dmp_trajectory_demo/start_pose geometry_msgs/PoseStamped "{header: {frame_id: 'base_link'}, pose: {position: {x: 0.011, y: -0.000, z: 0.103}, orientation: {x: -0.025, y: 0.995, z: 0.003, w: -0.098} }}"

goal pose

rostopic pub -r 10 /dmp_trajectory_demo/goal_pose geometry_msgs/PoseStamped "{header: {frame_id: 'base_link'}, pose: {position: {x: 0.273, y: -0.051, z: 0.544}, orientation: {x: 0.065, y: 0.168, z: -0.572, w: 0.801} }}"

follow launch png image file