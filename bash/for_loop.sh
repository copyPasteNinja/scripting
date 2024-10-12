#!/bin/bash 

# for item in list; do
#     # commands
# done

## Example 1
# for file in *.sh; do

#     echo $file
#     chmod +x $file
#     sleep .5

# done

## Example 2
users="$(cat /etc/passwd | awk -F ":" '{print $1}')"

for user in $users; do
    mkdir /var/games/$user
    ls -l /var/games/
    sleep 2
    clear

done