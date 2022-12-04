from flask import Blueprint,render_template,request,redirect,url_for,session
from database import *

public=Blueprint('public',__name__)

@public.route('/')
def home():
	return render_template("index.html")

@public.route('/registration',methods=['get','post'])
def registration():
	if 'register' in request.form:
		fname=request.form['Fname']
		lname=request.form['Lname']
		gender=request.form['gender']
		phoneno=request.form['phones']
		emailid=request.form['email']
		username=request.form['name']
		password=request.form['passwrd']
		q="INSERT INTO login VALUES(null,'%s','%s','user')" %(username,password)
		print(q)
		id=insert(q)
		q="INSERT INTO users VALUES(null,'%s','%s','%s','%s','%s','%s')"%(id,fname,lname,gender,phoneno,emailid)
		print(q)
		insert(q)

	return render_template("registration.html")

@public.route('/login',methods=['get','post'])
def login():
	if 'login' in request.form:
		username=request.form['name']
		password=request.form['pass']
		q="SELECT * FROM login WHERE username='%s' and password='%s'"%(username,password)
		res=select(q)
		if res:
			session['log_id']=res[0]['login_id']
			if res[0]['usertype']=="tutor":
				return redirect(url_for('tutor.tutorhome'))
			elif res[0]['usertype']=="admin":
				return redirect(url_for('admin.home'))
			elif res[0]['usertype']=="user":
				return redirect(url_for('user.user_home'))
	return render_template("login.html")
