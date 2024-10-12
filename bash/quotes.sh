#!/bin/bash 

var="World"

echo "Hello $var" 
echo 'Hello $var' 

info='''
Parameters represent the arguments passed to a script when it is executed.
$1 refers to the first argument, $2 refers to the second, and so on up to $9.

$#: The number of arguments passed to the script.
Useful for checking if the user has passed the correct number of arguments.

"'"$var "'"

$$: The process ID (PID) of the current script.
Each running script or process has a unique ID, which can be useful for logging or managing multiple instances of a script.
'''

cat <<EOF
This is a multi-line string.
It can span several lines.
Variables like $var will be expanded to its value.
EOF


