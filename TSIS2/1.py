def main(adress):
    s=""
    for i in range(len(adress)):
        if adress[i]==".":
            s=s+"[.]"
        else:
            s+=adress[i]
    return s
k = str(input())
print (main(k))