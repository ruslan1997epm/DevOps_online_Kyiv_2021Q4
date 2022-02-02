import math

def main():
     pass

def validate(coef):
     err = int(0)
     for k in [3, 2, 1]:
         try:
             print("Enter coef", coef, ":"),
             a = float(input())
         except ValueError:
             print("Invalid input, accepting only numbers. Retries left 
[", k-1, "]")
             err = 1
         else:
             err = 0
             return a, err

def discr(a, b, c):
     d = math.pow(b, 2)-4*a*c
     return d

def roots():
     a, err = validate('A')
     if err == 1: wasted()
     else:
         b, err = validate('B')
         if err == 1: wasted()
         else:
             c, err = validate('C')
             if err == 1: wasted()
     d = discr(a, b, c)
     print("D =", d)
     if d < 0:
         print("No Real roots. Exiting...")
         quit()
     x1 = round((-b + math.sqrt(d)) / (2 * a), 2)
     x2 = round((-b - math.sqrt(d)) / (2 * a), 2)
     if d == 0:
         print("Roots are equal (one Real root):", x1)
     if d > 0:
         print("Two Real roots:", x1, ",", x2)
     return x1, x2

def result():
     roots()

def wasted():
     print("You wasted all your three wishes...")
     quit()

if __name__ == "__main__":
     result()

