print("Address of object")
print("Python is very memory efficient which uses same address to save memory")
a=2 
b=a
print(id(a))
print(id(b))

print(------------------------------------------------------------------)

print("Print datatypes")
num=2
print(type(num))

num=2.5
print(type(num))

num=2.5+9j
print(type(num))

abc='xyz'
print(type(abc))

print("Convert float into intiger")
a=5.6
b=complex(b,a)
print(type(b))

print("Convert float into intiger")
a=5.6
b=int(a)
print(type(b))

d={'vaibhav':'samsung','rahul':'redmi','kiran':'oneplus'}
print(type(d))
print(d.values())

print(d['rahul'])
print(d.get('rahul'))

print(------------------------------------------------------------------)

print("Add 2 numbers")
a=2 
b=3
c=a+b
print(c)

print("Substract 2 numbers")
a=6 
b=3
c=a-b
print(c)

print("Multiply 2 numbers")
a=2 
b=3
c=a*b
print(c)

print("Divide 2 numbers")
a=2 
b=3
c=a / b
print(c)

print("Basic Variables")
x=2 
print(x+10)

print("Divide 2 numbers - Also called as integer division or floor division")
a=2 
b=3
c=a // b
print(c)

print("Qube of 2")
c=2*2*2
print(c)

print("Qube of 2")
c=2**3
print(c)

print("modilus of 2")
c=10%3
print(c)

print("Qube of 2")
c=2*2*2
print(c)

print(------------------------------------------------------------------)

print('vaibhav laptop')

print("vaibhav's laptop")

print('vaibhav "laptop"')

print('vaibhav\'s  "laptop"')

print('Print vaibhav 10 times')
c=10*'vaibhav'
print(c)

print(------------------------------------------------------------------)

print("print Array")
name=['V','A','I','B','H','A','V']
nums=[12,23,34,45]
print(name[2])
print(name[5])
print(name[1])
print(name[0:5])
print(name[:4])
print(name[2:])
print(len(name))

print(nums[0])
print(nums[3])

abc=[name,nums]
print(abc)

nums.insert(32,34)
print(nums)

nums.remove(12)
print(nums)

nums.sort()
print(nums)

nums.pop(1)
print(nums)

print("print sets-'It will always print in any order'")

s={12,23,4,55,64,34,96,43}
print(s)

print(------------------------------------------------------------------)