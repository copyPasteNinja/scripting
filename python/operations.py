# Write a Python program that takes two numbers and 
# an operator (+, -, *, /, %, //, **) as input and 
# performs the corresponding operation.

# install PIP
# dnf install python3-pip -y
# pip install inquirer

import inquirer

questions = [ inquirer.List(
    "operator", 
    message="Please choose an opearator: ", 
    choices=["+", "-", "*", "/", "//", "**", "%"], 
    default="+"
    ),
    inquirer.Text("num1", message="Enter first number"),
    inquirer.Text("num2", message="Enter second number"),
]

answers = inquirer.prompt(questions)
print(answers)

if answers['operator'] == '+':
    result = int(answers['num1']) + int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '-':
    result = int(answers['num1']) - int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '*':
    result = int(answers['num1']) * int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '/':
    result = int(answers['num1']) / int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '//':
    result = int(answers['num1']) // int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '**':
    result = int(answers['num1']) ** int(answers['num2'])
    print("Answer:", result)

elif answers['operator'] == '%':
    result = int(answers['num1']) % int(answers['num2'])
    print("Answer:", result)