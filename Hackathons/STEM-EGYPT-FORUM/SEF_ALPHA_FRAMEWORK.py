from flask import Flask, render_template as r, url_for, request, session, flash, redirect
from flask_login import LoginManager, login_required, logout_user, login_user
from flask_bcrypt import Bcrypt
from uuid import uuid4 as gen_id
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
   for row in rows :
       row = list(row)
       if prop == row[0] :
           res = row
   return row
def get_user_wUsername(username):
   rows = list(read_all())
   res = []
   for row in rows :
       row = list(row)
       if username == row[1] :
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
online_users = []
db_users = {}


           
class user():#necessary to work with the loginManager.
   def __init__(self, ID, username, is_authenticated = True, is_active = True , is_anonymous = False):
      self.is_authenticated=is_authenticated
      self.is_active=is_active
      self.ID = ID
      self.username = username
      self.is_anonymous = is_anonymous
   def get_id(inp):
      return gen_id()
   
conn = sqlite3.connect("database.sqlite3")

@lm.user_loader
def load_user(user_id):
   data = get_user_wID(user_id)
   return user(data[0], data[1])

@app.route('/')#the home page
def index():
   return redirect(url_for("register"))

@app.route('/admin')
def admin():
   return "Hello, Admin"

'''@app.route('/test')

def something():
   return r("CV.html")'''#for purpose of testing

@app.route('/login', methods=["POST", "GET"])
def login():#the main function that dictates the log-in operation
   print("Log in initiated")
   conn = sqlite3.connect("database.sqlite3")
   c = conn.cursor()
   if request.method == "POST":
      print("Request recieved.")
      username = request.form["username"]
      password = request.form["password"]
      user_data = get_user_wUsername(username)
      if (bcrypt.check_password_hash(user_data[9], password)):
         online_users.append(user(user_data[0], user_data[1]))
         login_user(online_users[len(online_users)-1], remember = True)
         flash("Login attempt successful")
         print("Authentication successful.")
         return redirect(url_for("profile"))
      else:
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
   logout_user()
   return redirect(url_for('index'))

@app.route('/profile')
@login_required
def profile():#It is planned to add more functionanlity to the profile page.
   #TODO
   return "Hello, fellow user."


if __name__=="__main__":#Runs the flask app in debug mode
   app.run(debug=True)
