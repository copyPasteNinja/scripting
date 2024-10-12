#!/bin/bash 

read -p "Enter a username: " username
read -p "Enter a home dir: " home
read -p "Enter a group: " group
read -p "Enter a UID: " uid
read -p "Enter a secure password: " passwd
read -p "Enter title for $username: " title

useradd $username -d $home -u $uid -G $group -c $title
passwd $username $passwd

echo "--------------------------------------------"
echo " USER $username created succesfully  "
echo "--------------------------------------------"

id $username

