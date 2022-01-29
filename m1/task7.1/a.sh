#!/bin/bash

# no-param : display keys and descriptions
# --all : ips and hostnames in current subnet
# --target : open tcp ports

clear

# a = number of args, passed to a script
a=$#
echo "Passed args: $a"


showhelp(){
	echo "Parameters:";
	echo "--all    : show ip's and hostnames of all hosts in local subnet";
	echo "--target : show open tcp ports on local host";
}

showhosts(){
	arp -a | awk '{print $1 $2}'
}

showtcp(){
	netstat -at
	nmap -sT -p- localhost
}

if [[ "$1" == "" ]]
	then showhelp
fi

if [[ "$1" = "--all" ]]
	then showhosts
fi

if [[ "$1" == "--target" ]]
	then showtcp
fi



#get-my-ip-subnet
#a.b.c.d/e
# ip addr | grep -E "inet (.*) brd" | awk '{print $2}'
# nmap -n 192.168.122.1/24



