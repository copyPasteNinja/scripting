#!/bin/bash


function help {
    echo "Expected 1 argument, recieved $#"
    echo "usage: $0 {user-name}"
    exit
}


if [ $# -eq 0 ]; then
    help
fi


if [[ "$1" == *"world"* ]]; then 
    echo "world exits"
else
    echo "world does not exist"
fi


## Second condition
# if [ $1 = "root" ]; then
#     echo "Welcome user $1"

# elif [ $1 = "alice" ]; then
#     id $1 | grep wheel
#     if [ $? -eq 0 ]; then
#        echo "$1 belongs to Wheel Group"
#     else
# 	  echo  "Your Access is Limited"
#     fi 
#     echo "Welcome $1!" 

# else
#     echo "access denied"
# fi    


