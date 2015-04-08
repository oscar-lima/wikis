Updating the urdf of the robot
=============================

When you need to add parts to the robot (such as a camera, plate, fingers etc.) the urdf of the robot needs to be updated.

The example here is to update the urdf to adjust the position/tilt of the Asus camera. You can follow similar steps for adjusting other parts as well.

* Run mir_bringup on the robot

		roslaunch mir_bringup robot.launch
* Open rviz and add the robot model and PointCloud2 from the Asus
* Move the arm if necessary, so that the arm is in view of the camera and it can be seen as a pointcloud
* Open the urdf file for the robot

		 mas_industrial_robotics/blob/hydro/mir_robots/mir_hardware_config/youbot-brsu-2/urdf/robot.urdf.xacro
* Update the values for the `asus_xtion_camera` tag
* Run the following command to update the urdf in the robot model in rviz

		roslaunch mir_hardware_config upload_param.launch; rosrun robot_state_publisher robot_state_publisher
* Repeat the previous two steps until the pointcloud of the arm (or other parts of the robot) match the robot model
