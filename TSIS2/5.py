def main(n):
        s1=1
        s2=0
        for i in range(6):
            if n==0:
                break
                
            s1*=n%10
            s2+=n%10
            
            n//=10
            
        return s1-s2
k = int(input())
print(main(k))