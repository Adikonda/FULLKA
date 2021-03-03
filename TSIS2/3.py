def main(nums):
    s=0
    for i in range(len(nums)):
        for j in range(i+1,len(nums)):
            if nums[i]==nums[j]:
                s+=1
                    
    return s
n = int(input())
list = []
for i in range (n):
   x= int(input())
   list.append(x)
print(main(list))