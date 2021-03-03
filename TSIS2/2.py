def main(add):
    s=''
    for i in range(len(add)):
        if add[i]=='(' and add[i+1]==')':
            s+='o'
            i+=1
        elif add[i]=='(' or add[i]==')':
            s+=''
        else:
            s+=add[i]
    return s
k = str(input())
print(main(k))

