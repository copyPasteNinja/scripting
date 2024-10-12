def conversion(num):
    binay_num = bin(num)
    octal_num = oct(num)
    hex_num = hex(num)

    print("<--------------------->")
    print("Binary #:", binay_num)
    print("Octal #:", octal_num)
    print("Hexadecimal #:", hex_num)
    print("<--------------------->")

decimal_num = int(input("Please enter number to convert: "))
conversion(decimal_num)