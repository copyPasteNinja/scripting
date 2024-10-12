#!/bin/bash 

# while [ condition ]; do
#     # commands
# done

count=1

while [ $count -le 5 ]; do
    echo "Count: $count"
    ((count++))
done
