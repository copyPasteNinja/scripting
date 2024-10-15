

firstname = input("Enter First Name: ")
lastname = input("Enter Last Name: ")

if firstname and lastname:
    print("Full Name:", firstname, lastname)

elif firstname or lastname:

    if firstname: 
        print("First name given:", firstname)
        
    if lastname: 
        print("Last name given:", lastname)
