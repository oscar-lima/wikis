color your git
==============

This wiki will help you to have colors on your git configuration so that
when you do git status the untracked files will appear on red, the changed files
in yellow and the added files in green color.

1. configure git to have colors:

		git config --global color.ui auto

2. edit your git config file:

		gedit ~/.gitconfig

3. add the following lines at the bottom:

		#personal config starts here: (this lines were added by oscar lima)

		# awesome color scheme:

		[color "branch"]
		    current = green reverse
		    local = green
		    remote = yellow

		[color "diff"]
		    meta = yellow bold
		    frag = magenta bold
		    old = red bold
		    new = green bold

		[color "status"]
		    added = green
		    changed = yellow
		    untracked = red

4. Done! now you should be able to go (in terminal) to a git repository, do git status and see
your changes in colors.
