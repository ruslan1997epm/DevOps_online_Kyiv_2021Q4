#!/bin/bash
#add new file - write to log
#delete/replace file - write to log
#run script every minute : * * * * * C.sh
# -u root (run script from root's crontab)

src=$1
dst=$2
rm ./LOG.log

arr=( $(ls $src) )

for n in "${arr[@]}"
do
	echo "$n"
	if [ -e $dst/$n ]
	then echo "$n : already exists, replacing..." >> LOG.log && rm $dst/$n && cp $n $dst
	fi
	if ! [ -e $dst/$n ]
	then echo "$n : does not exist, copying..." >> LOG.log && cp $n $dst
	fi
done

