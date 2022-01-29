#!/bin/bash

clear
echo 'hello world'
var1=2
echo var1 = $var1

test 10 -gt 55 ; echo $?
test 56 -gt 55 && echo true || echo false
[ 56 -gt 55 ] && echo true || echo false

if [ -f a.txt ]
	then echo exist
	else echo not found
fi

count=42
if [ $count -eq 42 ]
	then echo 42 is corrent
elif [ $count -gt 42 ]
	then echo too much
else echo not enough
fi

for i in 1 2 4
do echo $i
done

for counter in `seq 1 3`
do
echo counting from 1 to 3, now at $counter
#sleep 1
done

for counter in {1..3}
do
echo counting from 1 to 3, now at $counter
#sleep 1
done

i=3
while [ $i -ge 0 ]
do
echo counting down from $i to 0, now at $i;
let i--;
done


func1 () {
	echo "hello $1"
	return 5
}
func1 AAA
echo "exit code : $?"









