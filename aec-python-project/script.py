x=2
print(x)
print(x**2)

y='hello'
print(y)

z = x**2 + 5*x
print(z)

my_first_list = ['apple', 1, 'banana', 2]
my_fruit_list = ['apple', 'banana']
my_int_list = [1,2,3]

cal_lookup = {'banana':95, 'apple':105, 'orange':45}

for i in cal_lookup:
   print(cal_lookup[i]**2)



# for f in my_first_list:
#     print(f)

# for i in cal_lookup:
#     print(i, cal_lookup[i])


for i in my_first_list:
    if isinstance(i, int):
      print(i**2)
    elif isinstance(i, str):
      print(cal_lookup[i])
    else:
      print("etc")


def sq_int(x):
    y = x**2
    return y


i = 1
while i < 6:
  i += 1
  if i == 3:
    continue
  print(i)
else:
   print("i is no longer less than 6")


def is_even(i):
   if i % 2 == 0:
      return True
   else:
      return False
  
def is_odd(i):
   if i % 2 != 0:
      return True
   else:
      return False

def describe_evenness(x):
  if is_even(x):
    print("It's even!")
  elif is_odd(x):
    print("It's odd!")
  else:
    print("It's neither even nor odd!") 


