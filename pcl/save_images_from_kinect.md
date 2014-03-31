save images with kinect
=======================

This tutorial explains how to save images on your ubuntu system using microsoft kinect or asus depth camera.

1. Launch the openni driver:

		roslaunch openni2_launch openni2.launch

2. Run the image view node

		rosrun image_view image_view /image:=/camera/rgb/image_raw
		
3. Take the picture

		clicking on the image takes the picture

4. Done!

By now you should be able to save images from kinect to your system.