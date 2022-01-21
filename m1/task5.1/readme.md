Task 1.1

1) Log in to the system as root.
	su

2) Use the passwd command to change the password. Examine the basic parameters of the command. What system file does it change *?
	man passwd
	passwd -k --keep, -l --lock, --stdin, -u --unlock, -d --delete, -e --expire, -f --force, -n --minimum DAYS,
	passwd  -x --maximum DAYS, -w --warning DAYS, -i --inactive DAYS, -S--status
	/etc/passwd

	
3) Determine the users registered in the system, as well as what commands they execute. What additional information can be gleaned from the command execution?
	cat /etc/passwd
	cat /home/<username>/.bash_history


4) Change personal information about yourself.
	???


5) Become familiar with the Linux help system and the man and info commands. Get help on the previously discussed commands, define and describe any two keys for these commands. Give examples.
	man cat
	man passwd
	cat -vET (non-printable, EOLs, tabs)
	passwd -S (show info about user)
	passwd -d (delete password for user)


6) Explore the more and less commands using the help system. View the contents of files .bash* using commands.
	more /home/yas/.bash*
	less /home/yas/.bash*

	
7) * Describe in plans that you are working on laboratory work 1. Tip: You should read the documentation for the finger command.

	finger [-lmsp ] [user ... ] [user@host ... ]
		displays information about the system users
	
	-s displays user's login name, real name, terminal name and write status (as a "*" after the terminal name if write permission is denied), idle time, login time, office location and office phone number
	
	-l produces a multi-line format displaying all of the information described for the -s option as well as the user's home directory, home phone number, login shell, mail status, and the contents of the files ".plan" ".project" ".pgpkey" and ".forward" from the user's home directory

	-p prevents the -l option of finger from displaying the contents of the ".plan" ".project" and ".pgpkey" files
	
	-m prevents matching of user names; user is usually a login name; however, matching will also be done on the users' real names, unless the -m option is supplied; all name matching performed by finger is case insensitive


8) * List the contents of the home directory using the ls command, define its files and directories. Hint: Use the help system to familiarize yourself with the ls command.

	ls /home/yas/
	ls -la /home/yas/
	ls -la ~


Task 1.2


1) Examine the tree command. Master the technique of applying a template, for example, display all files that contain a character c, or files that contain a specific sequence of characters. List subdirectories of the root directory up to and including the second nesting level.

	tree
	-a show hidden files
	-d directories only
	-l follow symbolic links
	-f full path for each file
	-L <level> max depth of tree
	-P <pattern> -a files beginning with a dot, list only files that match pattern: tree -P *vagra*
	-I <pattern> list only files that does not match pattern


2) What command can be used to determine the type of file (for example, text or binary)? Give an example.
	file <filename>


3) Master the skills of navigating the file system using relative and absolute paths. How can you go back to your home directory from anywhere in the filesystem?
	cd
	cd ../..
	cd ~


4) Become familiar with the various options for the ls command. Give examples of listing directories using different keys. Explain the information displayed on the terminal using the -l and -a switches.
	ls -la
	ls -la | grep ^d		ls -d */		echo */		tree -d -L 1
	-l long (including permissions, owner/group, date
	-a all (including .hidden)
	-d
	-S sort by file size
	-i inode
	-t sort by time, new first


5) Perform the following sequence of operations: 
- create a subdirectory in the home directory;
	mkdir ~/subdir1
- in this subdirectory create a file containing information about directories located in the root directory (using I/O redirection operations);
	touch ~/subdir1/subfile1 & ls -la / | grep ^d > ~/subdir1/subfile1
- view the created file;
	(51-5.PNG)
- copy the created file to your home directory using relative and absolute addressing;
	cp subfile1 ~/subfile1
	cp subfile1 /home/yas/subfile1
- delete the previously created subdirectory with the file requesting removal;
	rmdir -i subdir1
- delete the file copied to the home directory.
	rm ~/subfile1


6) Perform the following sequence of operations:
- create a subdirectory test in the home directory;
	mkdir ~/test
- copy the .bash_history file to this directory while changing its name to labwork2;
	cp ~/.bash_history ~/test/labwork2
- create a hard and soft link to the labwork2 file in the test subdirectory;
	ln labwork2 labwork-hard-link
	ln -s labwork2 labwork-hard-link
- how to define soft and hard link, what do these concepts;
	hard link - same file, but different name and same size and inode
	soft link - link to file (shortcut)
- change the data by opening a symbolic link. What changes will happen and why
	touch labwork2-soft-link
	(original file date/time changes + hard link date/time changed)
- rename the hard link file to hard_lnk_labwork2;
	mv labwork2-hard-link hard_lnk_labwork2
- rename the soft link file to symb_lnk_labwork2 file;
	mv labwork2-soft-link symb_lnk_labwork2
- then delete the labwork2. What changes have occurred and why?
	rm -rf labwork2
	(hard link remained; soft link blinks! because no original file any longer)


7) Using the locate utility, find all files that contain the squid and traceroute sequence.
	locate -A squid
	locate -A traceroute


8) Determine which partitions are mounted in the system, as well as the types of these partitions.
	fdisk -l
	cat /etc/fstab
	lsblk


9) Count the number of lines containing a given sequence of characters in a given file.
	grep WORD file.txt | wc -l
	(5-11.PNG)


10) Using the find command, find all files in the /etc directory containing the host character sequence.
	find /etc -name localhost


11) List all objects in /etc that contain the ss character sequence. How can I duplicate a similar command using a bunch of grep?
	ls /etc | grep ss


12) Organize a screen-by-screen print of the contents of the /etc directory. Hint: You must use stream redirection operations.
	ls /etc | more


13) What are the types of devices and how to determine the type of device? Give examples.
	ls -l /dev
	c - character, b - block, p - pipe, s - socket

14) How to determine the type of file in the system, what types of files are there?
	file, directory, special (character, block, pipe, socket, link)
	ls -l | grep ^-
	ls -l | grep ^d
	ls -l | grep ^b
	ls -l | grep ^l
	ls -l | grep ^c
	ls -l | grep ^p
	ls -l | grep ^s


15) * List the first 5 directory files that were recently accessed in the /etc directory.
	ls -lt /etc | grep ^d | head 5
