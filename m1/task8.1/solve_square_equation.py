import math


def main():
     pass


def validate_param(coef):
     for k in [3, 2, 1]:
         try:
             print("Enter coef", coef, ":"),
             a = float(input())
         except ValueError:
             print("Invalid input, accepting only numbers. Retries left
[", k-1, "]")
         else:
             print(a)
             return a


def discriminant(a, b, c):
     d = math.pow(b, 2)-4*a*c
     return d

# def roots(b, d, a):
#    pass
#   x1=(-b+sqrt(d))/(2*a)
#   x2=(-b-sqrt(d))/(2*a)

# def solve_square(a,b,c): #->roots:
#    pass

# def print_square(a,b,c,roots):
#    pass


if __name__ == "__main__":

     a = validate_param('A')
     b = validate_param('B')
     c = validate_param('C')
     print(discriminant(a, b, c))

#   if type(float(a)) not in [int, float]:
#        print("Incorrect input. Accepting only numbers.")
#        quit()
#   print(type(a))
