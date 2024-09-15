# calc.py

import argparse

parser = argparse.ArgumentParser(description = "CLI Calculator")

subparsers = parser.add_subparsers(help="sub-command help", dest="command")

add = subparsers.add_parser("add", help="add integers")
add.add_argument("ints_to_sum", nargs="*", type=int)

sub = subparsers.add_parser("sub", help="subtract integers")
sub.add_argument("ints_to_sub", nargs="*", type=int)


def aec_subtract(ints_to_sub):
    if len(ints_to_sub) == 2:
        our_sub = ints_to_sub[0] - ints_to_sub[1]
        if our_sub < 0:
            our_sub = 0
        print(f"the subtraction of values is: {our_sub}")
        return(our_sub)
    elif len(ints_to_sub) < 2:
        raise Exception("Fewer than expected arguments")
    else:
        raise Exception("More than expected arguments")


mul = subparsers.add_parser("mul", help="multiply integers")
mul.add_argument("ints_to_mul", nargs=2, type=int)

div = subparsers.add_parser("div", help="divide integers")
div.add_argument("ints_to_div", nargs=2, type=int)

def aec_divide(ints_to_div):
    try:
        our_sub = ints_to_div[0] / ints_to_div[1]
    except ZeroDivisionError:
        our_sub = 0
    print(f"the division of values is: {our_sub}") 
    return(our_sub)

if __name__ == "__main__":

    args = parser.parse_args()

    if args.command == "add":
        our_sum = sum(args.ints_to_sum)
        print(f"the sum of values is: {our_sum}")

    if args.command == "sub":
        aec_subtract(args.ints_to_sub)
        # our_sub = args.ints_to_sub[0] - args.ints_to_sub[1]
        # print(f"the subtraction of values is: {our_sub}")

    if args.command == "mul":
        our_sub = args.ints_to_mul[0] * args.ints_to_mul[1]
        print(f"the multiplication of values is: {our_sub}")

    if args.command == "div":
        try:
            aec_divide(args.ints_to_div)
        except ZeroDivisionError:
            print("Warning: Denominator is 0. Cannot divide")
