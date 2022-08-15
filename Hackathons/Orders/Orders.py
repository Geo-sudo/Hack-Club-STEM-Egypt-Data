#Creating lists 
id, name, price, code, tag, ordr=[],[],[],[],[],[]
total=0
#Building some functions to be used now 
#IDs are automatic generated not inputed or stored in the storage. So, this function is to make sure the id is the same long as price list
def build_id():
    for x in range(len(price)-len(id)):
        id.append(x+1)

#This function to save the 2 lists in name and price in the a file called RAM.txt
def save():
    print("{Saving menus Done!}")
    open("RAM.txt" , 'a')
    ram= open("RAM.txt" , 'w')
    for pname,pprice in zip(name,price):
        ram.write(str(pname)+"------"+str(pprice)+"\n")

#This is to restore the 2 lists "name" and "price" from the RAM.txt file and call the build_id function 
def read():
    print("{Reading menus Done!}")
    for line in open("RAM.txt"):
        spilter=line.rsplit("------" ,1)
        name.append(spilter[0])
        dsplit=spilter[1].replace('\n','')
        price.append(int(dsplit))
    build_id()

#This is to save "code" and "tag" in another file called "ppl.txt"
def save_ppl():
    print("{Saving people list Done!}")
    open("ppl.txt" , 'a')
    ppl= open("ppl.txt" , 'w')
    for tcode,ttag in zip(code,tag):
        ppl.write(str(tcode)+"------"+str(ttag)+"\n")

#This is to restore "code" and "tag" from file called "ppl.txt"
def read_ppl():
    print("{Reading people list Done!}")
    for row in open("ppl.txt"):
        spiltppl=row.rsplit("------" ,1)
        code.append(int(spiltppl[0]))
        dsplitppl=spiltppl[1].replace('\n','')
        tag.append(dsplitppl)
def ShowMenu():
            for (x,y,z) in zip(id,name,price):   #these make the three lists show togther as a "table"
                print("---------------------")
                print(x,"|",y,"|",z)

    #------------------------------------------need edit
#this is for input
i=""
#first recieve all the inforamtion from the saved files
    #to check if the files are found if not create them 
open("RAM.txt" , 'a')
open("ppl.txt" , 'a')
open("reciet.txt" , 'a')
read_ppl()
read()
print("\n\nWelcome to the __Ultimate Order Collector__")
print("to end any process you're at, just write 'no' ")
Navigator=["","show","new","del","menu","order"]
while i in Navigator:
    i=input("\n--THE MAIN MENU--\nPeople list options:\nshow:\tshow the people list\nnew:\tadd new people to the list\ndel:\tdelete member from the list by code\n- - - - - - - - - - - - - - - - - - - - - - - - - \nMenu list options:\nmenu:\tshow menu\nedit:\tadd/remove things from the menu (need to restart the program to save changes)\n- - - - - - - - - - - - - - - - - - - - - - - - - \norder:\tto start collecting order\nno:\tsave and jump to the bigger menu or exit\n---------------------\nyour input: ")
    if i=="show":
        for (a,b) in zip(code,tag):            #these make the three lists show togther as a "table"
            print("---------------------")
            print(a,"|",b)
        i=""
        print("\n")
    
    while i=="new":                             #adding member
        NewMember= input("adding new memeber\n---------------------\nyour input: ")
        NewMember= NewMember.rsplit("_", 1)
        if NewMember==['no']:
            save_ppl()
            i=""
            continue
        elif len(NewMember)==2:
            Ncode=int(NewMember[0])
            Ntag=NewMember[1]
            if Ncode in code:
                index=2
                print("this code is already used by: ", tag[code.index(Ncode)], "\n")
            else:
                code.append(Ncode)
                tag.append(Ntag)
                reloop=input("Do you want to add another memeber? \ny:yes\nn:no\n---------------------\nyour input: ")
                if reloop=="y":
                    reloop=""
                    i="new"
                elif reloop=="n":
                    reloop=""
                    i=""
                    save_ppl()
        else:
            print("input is invalid please follow this format code_name, ex:\n054_Ahmed Waleed\n")

    while i=="del":                             #deleting member
        print("codes available in list: ", code)
        delete=(input("which code (numbers only) you want to remove ?\n---------------------\nyour input: "))
        if delete =="no":
            i=""
        else:
            delete=int(delete)
            if delete in code:
                ind=int(code.index(delete))
                print("Are you sure want to delete\t", delete,"|", tag[ind])
                confirmation=input("y:yes\nn:no\n---------------------\nyour input: ")
                if confirmation=="y":
                    code.remove(delete)
                    tag.remove(tag[ind])
                    reloop=input("Do you want to delete another memeber? \ny:yes\nn:no\n---------------------\nyour input: ")
                    if reloop=="y":
                        reloop=""
                        i="del"
                    elif reloop=="n":
                        reloop=""
                        i=""
                        save_ppl()
                elif confirmation=="no":
                    i=""
                    save_ppl()
                    
                else:
                    print("Invalid input")
                confirmation=""
            else:
                print("This code is not available in the list")

    if i =="menu":                              #show menu
        ShowMenu()
        i=""
        print("\n")            #this is for adding break line 
    
    if i=="order":                              #start ordering
        checker=input("The code of the one ordering ?\n---------------------\nyour input: ")
        if checker=="no":
            i=""
        else:
            checker=int(checker)
            if checker in code:
                index_3=code.index(checker)
                print("Do you want to order to ", checker , tag[index_3] )
                confirmation= input("y:yes\nn:no\n---------------------\nyour input: ")
                while confirmation=="y":
                    Nordr=input("please write down your order with this format 15_2_1 (No spaces and use _ as spliter)\nmenu: to show the menu \n---------------------\nyour input: ")
                    if Nordr=="no":
                        i=""
                        confirmation=""
                    elif " " in Nordr:
                        print("invalid input (contains spaces)")
                    elif Nordr =="menu":
                        ShowMenu()
                    else:
                        Nordr=Nordr.split("_")
                        tempordr=[]
                        temptotal=[]
                        tempname=[]
                        for place_holder in Nordr:
                            place_holder=int(place_holder)
                            if place_holder in id :
                                tempordr.append(place_holder)
                                tempname.append(name[place_holder-1])
                                temptotal.append(price[place_holder-1])
                                print(name[place_holder-1],"\t+", price[place_holder-1])

                            else:
                                print(place_holder, " doesn't exist in the menu")
                        print("confirm saving the identifeid things up there\n(Warning any number didn't identifeid won't be added) ?")
                        saving=input("y:yes\nn:no\n---------------------\nyour input: ")
                        if saving=="y":
                            print("{printing Reciet Done!}")
                            
                            reciet= open("reciet.txt" , 'a')
                            for tempo,tempo2 in zip(tempname,temptotal):
                                reciet.write(str(tempo)+"------"+str(tempo2)+"------"+str(tag[index_3])+"\n")
                            print("added successfully!")
                            ordr.extend(tempordr)
                            total=sum(temptotal)
                            print(tag[index_3],"will pay", sum(temptotal),"\nYou should have now", total)
                        elif saving=="no":
                            i="no"
                        elif saving=="n":
                            tempordr.clear
                            print("Order Deleted!")
                        else:
                            print("Invalid input")
                        print("want to add sth else to", tag[index_3], "?")
                        looper2=input("y:yes\nn:no\n---------------------\nyour input: ")
                        if looper2=="y":
                            pass
                        elif looper2=="no":
                            i=""
                            confirmation=""
                        elif looper2=="n":
                            confirmation=""
                        else:
                            print("Invalid Input")
            else:
                print("this code doesn't belong to someone\t", checker)

else:
    while i=="edit" :
        i=input("a: add \nr: remove \nno: for saving  \n---------------------\nyour input: ")
        while i=="a":
            new=input("New order? \n your input: ")
            nl=new.rsplit("_",1)    #this split the input into list with 3 parts and seperate when it find the "_"
            if nl==['no'] :          #this is for breaking the code
                i=''
                continue
            elif len(nl)!=2 :       #this makes sure it is divided to not get error by the termenate
                print("---------------------" "\n" "Error: write in this form ", "\n" "Name_Price", "\n" "e.i.", "\n" "pizza_25"  "\n""---------------------""\n""\n")
                continue
            name.append(nl[0])
            price.append(nl[1])
            i="edit"
        if i=="r":
            remove=int(input("which ID (numbers only) you wanna remove ? \nyour input: "))
            id.remove(id[remove-1])
            name.remove(name[remove-1])
            price.remove(price[remove-1])
            i="edit"
    if i=="no":
        save()
        save_ppl()
    else:
        print("invalid input\nEXIT WITHOUT SAVING")
        exit()