make video from rosbag image
============================

Thiw wiki explains how to make a movie clip (avi) from rosbag image topic previously recorded from a camera in ros.

Documentation can be found in:

		http://wiki.ros.org/rosbag/Tutorials/Exporting%20image%20and%20video%20data

1. Launch a node which publishes cam images, if you dont have one you can get one at the end of this wiki

2. Record a image raw bag

		mkdir ~/test && cd ~/test
		rosbag record /web_cam/image_raw

3. transform the bag into jpeg images

To do this, you will need to create a special roslaunch file.

Create a new empty file:

		gedit convert_bag_to_video.launch

put the following information on it and save it:

***BEGIN****

<?xml version="1.0"?>
<launch>
   <node pkg="rosbag" type="play" name="rosbag" args="-d 2 ~/test/test.bag"/>
   <node name="extract" pkg="image_view" type="extract_images" respawn="false" output="screen" cwd="ROS_HOME">
   <remap from="image" to="/web_cam/image_raw"/>
   </node>
</launch>

***END****

launch the previously created launch file:

		roslaunch convert_bag_to_video.launch

After launching the node wait until it finishes the process, it will save the bag as jpg images.

notice that the images will be saved under ~/.ros folder

4. move all images to a temp folder

		mv ~/.ros/frame*.jpg ~/test

4. transform all jpeg images to avi video

		mencoder "mf://*.jpg" -mf fps=10 -o output_video.avi -ovc lavc -lavcopts vcodec=mpeg4

notice that fps refers to the framerate, for sime unknown reason you should put the real framerate divided by 3.

example: my framerate is 30 fps, then put 10 in the command line arguments (fps=10)

Done! Now you should be able to see that a file output_video.avi was created inside ~/test with a movie
of your input rosbag

Resources
=========

Node which publishes cam images:

1. copy this lines of code into a text file named camera.launch

<?xml version="1.0"?>
<launch>

  <node pkg="usb_cam" type="usb_cam_node" name="web_cam" respawn="true" >  
    <param name="video_device" value="/dev/video0" />
    <param name="image_width" type="int" value="640" />
    <param name="image_height" type="int" value="480" />    
    <param name="autofocus" type="bool" value="true" />
    <param name="pixel_format" value="yuyv" />
    <param name="framerate" value="30" />
    <param name="brightness" value="10" />
    <param name="contrast" value="50" />
    <param name="saturation" value="38" />
  </node>

</launch>

2. replace video0 with your video device, you can do the following command to identify it:

		ls /dev/video*

3. launch the file

		roslaunch camera.launch

4. visualize the images comming from the camera

		rosrun rviz rviz
		add a image topic
		set the topic to /web_cam/image_raw

Done! now you should be able to see camera images in rviz and thereforo you can record your bag, go back to the 
top of the document to point number 2.
