vim tutorial
============

Small tutorial on vim terminal text editor usage.

Motivation: when you do ssh on a robot, sometimes oyu have to do small
edits on files, and nano is not good enough to do so.

vim is a more powerfull text editor which can give you more flexibility
to modifiy code from a terminal.

usage:

1. open vi, or vim
		vi
		vim
		vi my_file_name.txt
		vim my_file_name.txt


2. difference between vi and vim

vim is almost a proper superset of vi, so in simple words vim is better... it 
adds:

syntax highlighting, undo, redo, screen split, edit files inside compresed
folders, compare files with vimdiff, plugin support and more...

there is even a gvim version which offers a simple gui with some buttons to perform
commands instead of typing them...

3. how to quit vim?

press ESC to jump into command mode

type
		:q

4. switch between command mode and insert mode:

		i
		press ESC

5. save?

		enter command mode (ESC)
		:w	(write)
		:wq	(write and quit)

6. help

		:help

7. navigation

		$ - end of the line (or just press the home and end keys of your keyboard)
		0 - beginning of the line (or home button)
		w - move forward one word
		b - move backwards one word
		H M L - move to top, middle and lower part of the screen
		ctrl f - move forward one screen
		ctrl b - move backwards one screen
		G - end of the file
		1G - first line of the file
		6G - go to line 6 of the file
		
8. delete text

		x - delete one character ahead
		dw - delete all forward characters until finding a blank space
                     if dw i used at the beginning of a word then deletes the complete word
		d0 - delete everything to the left of the cursor till the beginning of the line
		d$ - delete every character to the right till the end of the line
		dd - delete one line
		8dd - delete eight lines
			

9. repeat last command

		.

10. search and replace

search

		/word - find a word, ahead of the cursor
		n - to find the next occurrence of the word
		N - to find the previous occurrence of the word
		* - given that the cursor is on a word alreay pressing * will take you 
		    to the next word matching this one
		# - given that the cursor is on a word alreay pressing # will take you
		    to the previous word matching this one
		/ + arrow up - get access to vim search history
		

search and replace:

                :s - search and replace, but takes some arguments (see examples below)

search and replace all lines in the document:

                :%s/word_to_replace/text/g

search and replace but ask first:

                :%s/word_to_maybe_replace/text/gc
                :%s/word_to_maybe_replace/text/gci (case insensitive)
                :%s/word_to_maybe_replace/text/gcI (case sensitive)		

11. make (compile the current file with make command)

		:make

12. undo / redo

		u -undo
		ctrl + R - redo

13. copy, paste

		v - select a text (use the right arrow as well)
		y - copy
		d - cut
		p - paste

14. show the last command

		type :
		then use the up arrow

15. compare two files and look for their differences

		run on terminal the following command:
		vimdiff file_to_edit.txt file_to_compare.txt

Now you can modify the files and look for the differences in a splitted
window

		ctrl + w (release) then arrows - jump between vim windows

16. split windows in vim

		:split - horizontal split
		:vsplit - vertical split

		:split filename - split window and load another file on it

17. jump between splitted windows

		:hide - close current window
		:split filename - split window and load another file
		: ctrl + w + arrows - move cursor to another window

18. open two files in separate splitted windows:

		vim -o file1.txt file3.txt

19. Done! Now you should be able to edit and create text files with vim editor
