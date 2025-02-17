#!/bin/bash

NUM1=$1

if [ $NUM1 -gt 10 ]; then
    echo "Number is greater than 10"
else
    echo "Number is less than 10"
fi

# multiple condidtions

if [ $NUM1 -gt 0 ]; then
    echo " $NUM1 is positive"
elif [ $NUM1 -lt 0 ]; then
	echo "$NUM1 is negative"
elif [ $NUM1 -eq 0 ]; then
	echo "$NUM1 is zero"
fi

# 3. String Comparison
# Operator	Meaning
#     ==	    Equal
#     !=	    Not Equal
#     -z	    String is empty
#     -n	    String is not empty

NAME=$2

if [ -z $NAME ]; then
	echo "please pass the argment"
elif [ -n $NAME ]; then
	if [ $NAME == 'sekhar' ]; then
		echo "you are sekhar!"
	elif [ $NAME != 'sekhar' ]; then
		echo "you are not sekhar"
	fi

fi