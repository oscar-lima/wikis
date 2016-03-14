datamatrix_finder
=================

This wiki describes how to use datamatrix finder rosnode to identify patterns (datamatrix patterns).

This will identify the pattern and will broadcast a frame on ros (tf) with 3D information about the position and orientation

of the pattern.


1. Print the datamatrix pattern.

First of all you need a printed pattern, so you can print the one comming with this repository or any

other datamatrix pattern that you can find on the web (search in google for datamatrix images).

A good size for the datamatrix would be around 12 cm, although other sizes are also detectable.

2. install the needed libraries

		sudo apt-get install libdmtx-dev

3. Clone compile and run the datamatrix finder

		mkdir -p ~/ros_ws/rockin/src
		cd ~/ros_ws/rockin/src
		catkin_init_workspace
		cd ..
		catkin_make
		echo 'source ~/ros_ws/rockin/devel/setup.bash' >> ~/.bashrc
		source ~/.bashrc
		cd ~/ros_ws/rockin/src
		git clone git@github.com:oscar-lima/rock-in.git
		cd ~/ros_ws/rockin
		catkin_make

If no errors, then done with the compilation and cloning.

4. Run the following ros nodes to test the datamatrix finder.

		roscore

for kinect:

		roslaunch openni_launch openni.launch
		
for asus:

		roslaunch openni2_launch openni2.launch (for asus)

run datamatrix finder node:

		rosrun datamatrix_finder datamatrix_finder_no 0.12

NOTE: replace 0.12 of the last instruction with the size in meters of your datamatrix pattern.

5. Run and configure rviz

		rosrun rviz rviz
		set fixed frame as : camera_rgb_optical_frame

Done!

By now you should be able to see the datamatrix frame using rviz