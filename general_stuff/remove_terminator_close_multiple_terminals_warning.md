remove close multiple terminals warning of terminator
=====================================================

This tutorial will help you to configure terminator not to display the annoying message

of "Close multiple terminals?" that appears everytime you attempt to close terminator application.

Documentation available at:

		http://crunchbang.org/forums/viewtopic.php?pid=312053
		https://launchpad.net/~gnome-terminator/+archive/ppa

1. Check your current terminator version:

		terminator -v

expected output:

		terminator 0.96

This is by default the version in ubuntu 12.04 right now (17.03.2014)

2. Upgrade terminator to version 0.97:

		sudo add-apt-repository ppa:gnome-terminator/ppa
		sudo apt-get update
		sudo apt-get install --reinstall terminator

3. Check that terminator has now upgraded to the new version 0.97

		terminator -v

expected output:

		terminator 0.97

4. Disable warning checking:

open terminator

		terminator

Make at least two terminals in the same window

		right mouse click -> split horizontal

close terminator, a window should now pop up and you should be able to click on:

		Do not show this message next time

Done! Now everytime you close terminator it will not show this annoying warning again:

		Close multiple terminals?