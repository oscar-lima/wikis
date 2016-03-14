Perception hands on 
===================

This wiki will help you to try the robocup perception pipeline.

setup : your latop with brsu robocup@work code installed, an asus camera looking at @work objects

tested : under ros indigo on 18.02.2016, indigo branch (main branch)

concepts :

registration - means that we have a colored pointcloud

1. Launch the depth camera driver, with option to run asus frames as well

        roslaunch mir_bringup openni2.launch publish_tf:=true

2. Open rviz and configure :

        set fixed frame : arm_cam3d_link
        add pointcloud2 topic set it to listen to /arm_cam3d/depth_registered/points
        style : points
        size (Pixels) : 1
        color transformer : RGB8

3. Launch perception pipeline :

        roslaunch mcr_object_recognition_mean_circle object_recognition.launch

4. 

        