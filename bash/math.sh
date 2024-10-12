#!/bin/bash

a=25
b=10

total=$((a + b))
echo $total


## comparison operations
# if [ condition ]; then
#    execute tasks
#
# fi 

if [ $total -lt 50 ]; then
	echo "Result: $total is less than 50"

else
	echo "condition did not meet"
	echo "Destroying everyting..."

fi


