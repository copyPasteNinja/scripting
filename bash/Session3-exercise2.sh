#!/bin/bash 



# Select an option:
# 1) Show date
# 2) List files
# 3) Show user
# 4) Exit



echo """
1) Show date
2) List files
3) Show user
4) Exit
"""
read -p "Select an option: " choice


case $choice in 

    1) 
        date
    ;;
    2)
        ls 
    ;;
    3)
        whoami
    ;;
    4)
        echo "Existing..."
        exit
    ;;
    *)
        echo "Invalid input. Please enter valid option (ex: 1 or 2)"
    ;;
esac
