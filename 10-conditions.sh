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

#  String Comparison
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


# File Operators
# Operator	Checks If...
#     -e	    File exists (any type)
#     -f	    Regular file exists (not a directory)
#     -d	    Directory exists
#     -r	    File is readable
#     -w	    File is writable
#     -x	    File is executable

FILE=$3

if [ -e $FILE ]; then
    echo "File exists"
elif [ -r $FILE ]; then
    echo "File is readable"
elif [ -w $FILE ]; then
    echo "File is writable"
elif [ -x $FILE ]; then
    echo "File is executable"
fi

# Logical Operators
# Operator	Meaning
#     !	    Not
#     -a	    And
#     -o	    Or
#     ||       Or
#     &&       And

if [ -e $FILE ] && [ -r $FILE ]; then
    echo "File exists and is readable"
fi

if [ -e $FILE ] || [ -r $FILE ]; then
    echo "File exists or is readable"
fi

if [[ !(( -f "$FILE" && -r "$FILE") ||  -w "$FILE") ]]; then
    echo "Condition met"
fi