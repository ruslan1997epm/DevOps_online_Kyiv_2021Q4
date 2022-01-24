Task 5.2


1) Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?

[root@localhost yas]# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin

Username:Password:UID:GID:GECOS:Homedir:Login_shell

[root@localhost yas]# cat /etc/group
root:x:0:
bin:x:1:

Username:Password:GID:User1,User2,...,UserN


2) What are the uid ranges? What is UID? How to define it?

UID is 32-bit, 0..4294967295, 4 UIDs are special: 0 = root, 65534 = nobody, 16-bit-1 (65535), 32-bit-1(4294967295)
UID = numerical representation of a user in Unix system


3) What is GID? How to define it?

GID = Group ID, numerical representation of a group


4) How to determine belonging of user to the specific group?

#groups username


5) What are the commands for adding a user to the system? What are the basic parameters required to create a user?

#adduser, useradd
-b base dir
-d home dir
-e expiration date
-f inactive
-g gid
-m create home
-M dont create home
-N dont create group with same name as user
-p password
-r system account
-s login shell
-u uid
-U create group with same name as username


6) How do I change the name (account name) of an existing user?
#usermod -l new-name


7) What is skell_dir? What is its structure?

/etc/skel/ is used to initiate home directory when a user is first created
contains 'template' files that are created, like .bashrc .bash_profile .bash_logout, etc


8) How to remove a user from the system (including his mailbox)?
#userdel -r username


9) What commands and keys should be used to lock and unlock a user account?

#passwd -l username
#passwd -u username


10) How to remove a user's password and provide him with a password-free login for subsequent password change?

#passwd -d test && passwd -e test


11) Display the extended format of information about the directory, tell about the information columns displayed on the terminal.

[yas@localhost ~]$ ls -l
total 1331088
drwxrwxr-x. 3 yas  yas          15 Sep 22 18:41 1
-rwxrwxr-x. 1 yas  yas          55 Oct 18 19:34 11.sh
-rw-r--r--. 1 root root         10 Sep 24 02:45 123
-rw-rw-r--. 1 yas  yas       28568 Nov 10 05:52 1.txt

permissions, N-of-items-inside, owner, owner_group, size, last-access-date-and-time, filename


12) What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.

rwx read write execute(also counts as entering a directory)
ugoa user(owner) group others all(everybody)


13) What is the sequence of defining the relationship between the file and the user?
???


14) What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal.

#chown new-user:new-group filename
#chmod ugoa+-rwx filename

[root@localhost yas]# touch FILE12345
[root@localhost yas]# ll|grep FILE
-rw-r--r--. 1 root root          0 Jan 24 11:24 FILE12345
[root@localhost yas]# chown yas FILE12345
[root@localhost yas]# ll|grep FILE
-rw-r--r--. 1 yas  root          0 Jan 24 11:24 FILE12345
[root@localhost yas]# chown yas:wheel FILE12345
[root@localhost yas]# ll|grep FILE
-rw-r--r--. 1 yas  wheel          0 Jan 24 11:24 FILE12345
[root@localhost yas]# 
[root@localhost yas]# chmod u+x FILE12345 
[root@localhost yas]# ll|grep FILE
-rwxr--r--. 1 yas  wheel          0 Jan 24 11:24 FILE12345
[root@localhost yas]# chmod g+w FILE12345 
[root@localhost yas]# ll|grep FILE
-rwxrw-r--. 1 yas  wheel          0 Jan 24 11:24 FILE12345
[root@localhost yas]# chmod a+rwx FILE12345 
[root@localhost yas]# ll|grep FILE
-rwxrwxrwx. 1 yas  wheel          0 Jan 24 11:24 FILE12345
[root@localhost yas]# 


15) What is an example of octal representation of access rights? Describe the umask command.

#umask [-p] [-S] [mask]
-p		displays current mask along with the umask command, allowing it to be copied and pasted as a future input
-S		displays current mask as a symbolic value
mask	new permissions mask

0 --- no permission
1 --x execute
2 -w- write
3 -wx write, execute
4 r-- read
5 r-x read, execute
6 rw- read, write
7 rwx read, write, execute


16) Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes.

'sticky bit' is a protection mechanism, that forbids users to change/delete files they do not own
#chmod +t /SHARED-DIR


17) What file attributes should be present in the command script?

'execute' (+x) for user who tries to execute a script


