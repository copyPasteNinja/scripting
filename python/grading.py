# Grading System: Write a program that takes a number input (0-100) 
# from the user and prints a grade using the following system:
# A: 90-100
# B: 80-89
# C: 70-79
# D: 60-69
# F: below 60

grade = input("Whats your score?: ")
if grade.isdigit():
    grade = int(grade)
    if grade >= 90:
        print("Your grade: A")
    elif grade >= 80:
        print("Your grade: B")
    elif grade >= 70:
        print("Your grade: C")
    elif grade >= 60:
        print("Your grade: D")
    else:
        print("Your grade: F")   
else:
    print("error: invalid entry, you must enter numeric value")