TASK 5.3


Part1


1. How many states could has a process in Linux?

4 running,sleeping(waiting),stopped,zombie
ps -> column 'S'
ps -o pid,state,command


2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.
pstree -a (include command line arguments)
pstree -p (include PIDs)
pstree -u (show users)
pstree -h (highlight current process)
pstree -g (show GIDs)
pstree user (show processes specifit to user)


3. What is a proc file system?

Its a file system created on the fly when system boots and dissolved when system shuts down.
It contains useful information about processes currently running, considered as control/information center for the kernel.
Provides communication medium between kernel space and user space.


4. Print information about the processor (its type, supported technologies, etc.).

#lscpu


5. Use the ps command to get information about the process. The information should be as follows: the owner of the process, the arguments with which the process was launched for execution, the group owner of this process, etc.

#ps -aux | grep jenkins
#pstree -puag 951


6. How to define kernel processes and user processes?

kernel process - runs in kernel memory space with privileges to access hardware/memory
user process - runs in user space with restricted privileges


7. Print the list of processes to the terminal. Briefly describe the statuses of the processes. What condition are they in, or can they be arriving in?

#ps -aux

D - uninterruptible sleep (cannot be killed w/o rebooting the system)
R - running or runnable(queued)
S - interruptible sleep (waiting for event to complete)
T - stopped
Z - zombie; terminated, but not closed by parent
W - has no resident pages
< - high-priority process
N - low-priority task
L - has pages locked into memory (for real-time or custom IO)


8. Display only the processes of a specific user.

#ps -u jenkins


9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)?

#ps -p PID
#ps -U RUID (real UID, user created process)
#ps -u EUID (effective UID, whose file access permissions used by process)
#ps -el list all processes resident in memory
#pmap PID
#top
#htop
#kill PID


10. What information does top command display?

Users logged in the system, processes(tasks) and related information (PIDs etc), CPU and memory utilization.

12. Display the processes of the specific user using the top command.

#top -U username


12. What interactive commands can be used to control the top command? Give a couple of examples.

Arrow keys;
1 - show statistics per CPU core;
t - show CPU bar graphs;
m - show memory/swap bar graphs;
z - add colors;
PMNT - sort colums by CPU, memory, PID, time running;
c - switch between process name and full command line;
u - see processes for single user (will ask username);
q - quit;


13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.)

PMNT - sort colums by CPU, memory, PID, time running;


14. Concept of priority, what commands are used to set priority?

#top -> NI column, (-20..20)
#nice - start a process with specified nice-value;
#nice -n 5 bash
#renice - change nice-value of already running process;
#renice value PID


15. Can I change the priority of a process using the top command? If so, how?

#top -> r -> PID -> nice-value


16. Examine the kill command. How to send with the kill command process control signal? Give an example of commonly used signals.

#kill PID
#kill -l
#kill -5 PID
#kill -SIGTERM PID
#kill -SIGKILL PID


17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to demonstrate the process control mechanism with fg, bg.

#jobs - user-owned processes, while 'process' - is kernel-owned process; list jobs in current shell;
#vi 123.txt & - launch job at background
#jobs - list current jobs
#fg N - bring job to foreground
#bg N - send job to background
#nohup - runs a process even after logging out of terminal/shell


Part2

1. Check the implementability of the most frequently used OPENSSH commands in the MS Windows operating system.
(Description of the expected result of the commands + screenshots: command – result should be presented)

https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse


2. Implement basic SSH settings to increase the security of the client-server connection
(at least 3. List the options for choosing keys for encryption in SSH. Implement 3 of them.

4. Implement port forwarding for the SSH client from the host machine to the guest Linux virtual machine behind NAT.

5. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.


