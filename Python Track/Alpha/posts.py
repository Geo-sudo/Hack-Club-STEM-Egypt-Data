import sqlite3
from datetime import datetime as t
from hashlib import sha512 #Imported for testing the encryption of password
from uuid import uuid4 as ID
conn = sqlite3.connect("posts.sqlite3") #initializes a connection to the database (And creates one if not existent)

c = conn.cursor()

c.execute("CREATE TABLE IF NOT EXISTS posts(postid TEXT, userid TEXT, username TEXT, dt TEXT, txt TEXT, atch INT)")

def read_all():
   #conn = sqlite3.connect("database.sqlite3")
   #c = conn.cursor()
   c.execute("SELECT * FROM posts")
   
   info = c.fetchall()
   
   return info

def register(userid , username, txt, atch=0): #Registers a new user.

   c.execute("INSERT INTO posts VALUES(?, ?, ?, ?, ?, ?)", (str(ID()), userid, username , t.now().strftime("%c") , txt, atch))
   conn.commit()
   
'''def read_all(): #Reads and outputs all data in the database.
   
   c.execute("SELECT * FROM posts")
   
   info = c.fetchall()
   
   return info
'''
def get_rows(prop):#Searches, and returns all rows of data associated with a given property.
   rows = list(read_all())
   data = []
   for row in rows :
       row = list(row)
       if prop in row :
           data.append(row)
   return data
def delete(username, password):
   c.execute("DELETE FROM users WHERE username == ? AND password == ?", (username, password))#Deletes a specific user associated with a specific username and password
   conn.commit()


'''def form_of_results(rows) :
   rows = list(rows)
   if len(rows) > 0 :
       for data in rows :
           print("""==========
Name : """, data[0], """
Profession : """, data[1], """
age : """, data[2], """
==========""")
   else :
       print("No results found")
'''
while True:#Commands used to test the database separately.
   command = input()
   if command == "help" :
       print("""=========
help : shows this box
show all : shows all the data in the DB
search : returns all the related results to the inserted info
delete : deletes a specific row in the DB
register : registers new data
quit : terminates the program
=========""")

       
   elif command == "search" :
       data = input()
       print("The results are :\n")
       print(get_rows(data))

       	  
   elif command == "delete" :
	   print("Enter the full data of the row to delete it :\n")
	   name = input()
	   pswrd = input()
	   pswrd = sha512(str.encode(pswrd)).hexdigest()
	   delete(name, pswrd)
	   print("These are the data of the DB after deletion :\n")
	   print(read_all())
	   
	  
   elif command == "show all" :
	   print("These are all the info in the DB :\n")
	   print(read_all())
	   
	  
   elif command == "register" :
	   print("Enter the data to add :\n")
	   userID = input()
	   username = input()
	   txt = input()
	   atch = input()
	   register(userID, username, txt, atch)
	   print("The data in the DB after registration :\n")
	   print(read_all())
	  
   elif command == "quit" :
	   break
	  
   else :
	   print(command, "is an unknown command please run again and check the capitalization")
