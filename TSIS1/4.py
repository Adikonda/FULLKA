'''x = "awesome"

def myfunc():
  print("Python is " + x)

myfunc()'''



x="awesome"

def myfunc():
    x="mega"
    print("Python is "+ x)

myfunc()

print("python is "+x)


x = "awesome"

def myfunc():
  global x
  x = "fantastic"

myfunc()

print("Python is " + x)