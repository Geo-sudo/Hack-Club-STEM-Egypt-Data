from flask import Flask, render_template as r, url_for, request, session, flash, redirect, make_response
from flask_login import LoginManager, login_required, logout_user, login_user, current_user, UserMixin
from flask_bcrypt import Bcrypt
from uuid import uuid4 as gen_id
from datetime import datetime as t
import sqlite3
def reg(ID, username, firstname, lastname,  alias, school, email, homecity, grade, password):
   conn = sqlite3.connect("database.sqlite3")
   c = conn.cursor()
   c.execute("INSERT INTO users VALUES(?, ?, ?, ?, ? , ?, ?, ?, ?, ?)", (ID, username, firstname, lastname, alias, school, email, homecity, grade, password))
   conn.commit()
def read_all():
   conn = sqlite3.connect("database.sqlite3")
   c = conn.cursor()
   c.execute("SELECT * FROM users")
   
   info = c.fetchall()
   
   return info
def new_post(userid , username, txt): #Registers a new user.
   conn = sqlite3.connect("posts.sqlite3")
   c = conn.cursor()
   f = open("thumbnail.txt", "r")
   atch = int(f.read())+ 1
   atch =int(atch)
   f.close()
   f = open("thumbnail.txt", "w")
   f.write(str(atch))
   f.close
   c.execute("INSERT INTO posts VALUES(?, ?, ?, ?, ?, ?)", (str(gen_id()), userid, username , t.now().strftime("%c") , txt, atch))
   conn.commit()

def read_all_posts():
   conn = sqlite3.connect("posts.sqlite3")
   c = conn.cursor()
   c.execute("SELECT * FROM posts ORDER BY atch DESC;")
   
   info = c.fetchall()
   
   return info

def get_rows(prop):
   rows = list(read_all())
   data = []
   for row in rows :
       row = list(row)
       if prop in row :
           data.append(row)
   return data

def get_user_wID(prop):
   rows = list(read_all())
   res = []
   print("The available data is :")
   print(rows)
   for row in rows :
       row = list(row)
       if prop in row :
           res = row
   return res
           
def get_user_wUsername(username):
   rows = list(read_all())
   res = []
   print("The available data is :")
   print(rows)
   for row in rows :
       row = list(row)
       if username in row :
           res = row
   return res
lm = LoginManager()
'''
def form_of_results(rows) :
   rows = list(rows)
   if len(rows) > 0 :
       s=""
       for data in rows :
           s+= """==========<br>
Name : {}<br>
Profession : {}<br>
age :  {}<br>
==========<br>""".format(data[0],data[1],data[2])
       return s
   else :
       return "No results found\n"
'''
app =  Flask(__name__)
app.secret_key = "STEM for all" #A key required to sign sessions, cookies, etc.
lm.init_app(app)#Initializes the application's support fot login operations.
bcrypt = Bcrypt(app)#required for using flask_bcrypt's password encryption.
logged_users = {}
db_users = {}

           
class user(UserMixin):#necessary to work with the loginManager.
   def __init__(self, data):
      self.id = data[0]
      self.username = data[1]
   def get_id(self):
      return str(self.id)
'''
class post():
   def __init__(self, data):
      self.postid = data[0]
      self.userid = data[1]
      self.dt = data[2]
      self.txt = data[3]
      self.atch = data[4]
''' 
conn = sqlite3.connect("database.sqlite3")

@lm.user_loader
def load_user(user_id):
   d = str(user_id)
   print("Loading user with ID: "+d)
   
   data = get_user_wID(user_id)
   if data != []:
      session["ID"] = data[0]
      session["username"] = data[1]
      return user(data)
   else:
      return user(["0", "anonymous"])

@app.route('/', methods=["POST", "GET"])#the home page
def index():
   sm = current_user.is_authenticated
   if request.method == "POST":
      if current_user.is_authenticated:
         blog_post = request.form["data"]
         new_post(session["ID"], session["username"], blog_post)
         posts = read_all_posts()
         return r("posts.html", posts=posts, auth = True)
      else:
         blog_post = request.form["data"]
         new_post(session["ID"], session["username"], blog_post)
         posts = read_all_posts()
         return r("posts.html", posts=posts, auth = False)
   else:
      posts = read_all_posts()
      return r("posts.html", posts=posts, auth = sm)

@app.route('/admin')
def admin():
   return "Hello, Admin"

'''@app.route('/test')

def something():
   return r("CV.html")'''#for purpose of testing

@app.route('/login', methods=["POST", "GET"])
def login():#the main function that dictates the log-in operation
   if current_user.is_authenticated:
      logout_user()
      session.pop("username", None)
      session.pop("ID", None)
      
   print("Log in initiated")
   conn = sqlite3.connect("database.sqlite3")
   c = conn.cursor()
   if request.method == "POST":
      print("Request recieved.")
      exist = True
      try:
         username = request.form["username"]
         user_data = get_user_wUsername(username)
         print(user_data)
      except:
         exist = False
         
      try: 
         password = request.form["password"]
         session["ID"] =  user_data[0]
         current_user.username = username
         current_user.id = user_data[0]
         print(user_data[0])
         if bcrypt.check_password_hash(user_data[9], password):
            logged_users[user_data[0]]=(user(user_data))
            login_user(logged_users[user_data[0]], remember = True)
            #session["is_auth"] = True
            flash("Login attempt successful")
            print("Authentication successful.")
            return redirect(url_for("profile"))
         else:
            return redirect(url_for("login"))
      except:
         flash("Invalid credentials, try again.")
         return redirect(url_for("login"))
   else:
      return r("login-cover.html")
      
      

   
@app.route('/register', methods=["POST", "GET"])
def register():#rRegisters a user into the database.
   if request.method == "POST":
      username = request.form["username"]
      firstname = request.form["firstname"]
      lastname = request.form["lastname"]
      alias = request.form["alias"]
      grade = request.form["grade"]
      homecity = request.form["homecity"]
      school = request.form["school"]
      password = str(request.form["password"])
      email = request.form["email"]
      ID = str(gen_id())
      password = bcrypt.generate_password_hash(password).decode('utf-8')
      reg(ID, username, firstname, lastname,  alias, school, email, homecity, grade, password)
      flash("Account registtered successfully. Please, login to access yout account")
      
      return redirect(url_for('login'))
   else:
      return r("Register-cover.html")
      
@app.route('/logout')#Logs out a user.
@login_required
def logout():
   username = current_user.username
   logout_user()
   posts = read_all_posts()
   session.pop("username", None)
   session.pop("ID", None)
   resp = make_response(r('posts.html', posts=posts, auth = False))
   resp.delete_cookie(username)
   return resp


@app.route('/profile/')
@login_required
def profile():
   #TODO
   data = get_user_wUsername(current_user.username)
   return r("profile.html", data = data)

if __name__=="__main__":#Runs the flask app in debug mode
   app.run(host = "0.0.0.0",debug=True)
