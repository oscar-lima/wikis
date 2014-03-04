get openni work with asus xtion
===============================

Documentation available at:

		http://robotica.unileon.es/mediawiki/index.php/PCL/OpenNI_troubleshooting

In order to get our Xtion device working with OpenNI, we have to modify a configuration file:

1. Edit the global default configuration:

		sudo gedit /etc/openni/GlobalDefaults.ini

2. Find the line that says 

		;UsbInterface=2

3. Uncomment it (remove the semicolon at the start). 

4. Save and close the file. 

Done! Reboot your computer, and you should be able to use your Xtion device with OpenNI/PCL. 

If you want to switch to a Kinect instead, you must change the value from 2 to 0 (or comment the line), 

or else you will get the same "No devices connected" error. 