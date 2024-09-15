# calc.py

import argparse

parser = argparse.ArgumentParser(description = "CLI Calculator")

subparsers = parser.add_subparsers(help="sub-command help", dest="command")

add = subparsers.add_parser("add", help="add integers")
add.add_argument("ints_to_sum", nargs="*", type=int)

sub = subparsers.add_parser("sub", help="subtract integers")
sub.add_argument("ints_to_sub", nargs=2, type=int)

mul = subparsers.add_parser("mul", help="multiply integers")
mul.add_argument("ints_to_mul", nargs=2, type=int)

div = subparsers.add_parser("div", help="divide integers")
div.add_argument("ints_to_div", nargs=2, type=int)

args = parser.parse_args()

if args.command == "add":
    our_sum = sum(args.ints_to_sum)
    print(f"the sum of values is: {our_sum}")

if args.command == "sub":
    our_sub = args.ints_to_sub[0] - args.ints_to_sub[1]
    print(f"the subtraction of values is: {our_sub}")

if args.command == "mul":
    our_sub = args.ints_to_mul[0] * args.ints_to_mul[1]
    print(f"the multiplication of values is: {our_sub}")

if args.command == "div":
    try:
        our_sub = args.ints_to_div[0] / args.ints_to_div[1]
        print(f"the division of values is: {our_sub}")
    except ZeroDivisionError:
        print("Warning: Denominator is 0. Cannot divide")
