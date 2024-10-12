#!/bin/bash

log_file='/var/log/messages'
error_count=0

# error_count=+$(grep -i "error" $log_file | wc -l)

while read -r line; do
    echo $line | grep "error" > /dev/null
    if [ $? -eq 0 ]; then
        ((error_count++))
    fi 

done < "$log_file"

echo "Total Error accured: $error_count"