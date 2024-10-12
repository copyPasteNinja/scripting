#!/bin/bash 


function world {
    echo "First arg: $1"
    echo "Second arg: $2"
}

function calculate_sum {
    local result=$(( $1 + $2 ))
    echo "$result"
}

calculate_sum 8 5
echo $result