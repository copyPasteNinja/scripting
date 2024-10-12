#!/bin/bash 


# case $variable in
#     pattern1)
#         # commands for pattern1
#         ;;
#     pattern2)
#         # commands for pattern2
#         ;;
#     *)
#         # default case
#         ;;
# esac

#!/bin/bash

read -p "Enter a day of the week (e.g., Mon, Tue, Wed): " day

case $day in

    "Mon")
        echo "It's Monday! Let's start the week strong."
        ;;
    "Tue")
        echo "It's Tuesday! Keep going!"
        ;;
    "Wed")
        echo "It's Wednesday! Halfway through the week."
        ;;
    "Thu")
        echo "It's Thursday! Almost there."
        ;;
    "Fri")
        echo "It's Friday! The weekend is near."
        ;;
    "Sat" | "Sun")
        echo "It's the weekend! Time to relax."
        ;;
    *)
        echo "Invalid input. Please enter a valid day like Mon, Tue, etc."
        ;;
esac