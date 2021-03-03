def main(n):
        maxi=n[0]
        s=0
        for i in range(len(n)):
            s=s+n[i]
            if maxi < s:
                maxi = s
        return maxi
n = int(input())
list = []
for i in range (n):
   x= int(input())
   list.append(x)
print(main(list))