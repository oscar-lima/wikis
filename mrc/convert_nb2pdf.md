Convert ipython notebook to pdf
===============================

This wiki will help you to convert from .ipynb to html and then print to pdf for mrc submission to LEA

SETUP

1. Install pandoc:

		sudo apt-get install pandoc

2. Install add on of firefox to convert to pdf:

		print pages to PDF

3. Install adobe reader pdf

		sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
		sudo apt-get update
		sudo apt-get install acroread

USAGE

2. Enable anaconda environment:

		enable_anaconda

3. convert to html

		ipython nbconvert your_file.ipynb --to html

4. open with browser

5. right click on any point of the opened html

6. select "print pages to pdf" -> print active tab

it should open with acrobat reader now

7. save pdf from acrobat reader

Done! Now you should be able to visualize your ipython notebook in pdf