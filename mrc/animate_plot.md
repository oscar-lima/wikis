Convert ipython notebook to pdf
===============================

This wiki will help you to animate any plot output written with matplotlib in python

Documentation available at:

		http://unix.stackexchange.com/questions/24014/creating-a-gif-animation-from-png-files
		(creating gif from png images)
		
		http://www.youtube.com/watch?v=K5qoS781qOw
		http://pastebin.com/HGzF8n9k

1. save all desired plots (matplotlib plot) as .png files

		import pylab
		ind = 1 #give ind = 1, 2, 3, 4 to create different sequential images
		pylab.savefig('anim%03d.png'%ind, dpi=100) #save plot as png

2. make mp4 video from png files

		ffmpeg -sameq -i anim%03d.png cube.mp4

3. make gif animation from mp4 video files

		ffmpeg -i cube.mp4 -pix_fmt rgb24 -s qcif -loop_output 0 cube.gif

Done! Now you should be able to create animated gifs using matplotlib