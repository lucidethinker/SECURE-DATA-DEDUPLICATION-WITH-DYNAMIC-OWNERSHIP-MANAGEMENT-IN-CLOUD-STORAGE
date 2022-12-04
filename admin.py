from flask import Flask,render_template,Blueprint,request,redirect,url_for
from database import *


admin=Blueprint('admin',__name__)

@admin.route('/home')
def home():
	return render_template("admin.html")

@admin.route('/manage_subjects',methods=['get','post'])
def manage_subjects():
	data={}
	q="SELECT * FROM subjects"
	res=select(q)
	data['subjects']=res
	if 'add' in request.form:
		subject=request.form['sub']
		description=request.form['Description']
		q="INSERT INTO subjects values(NULL,'%s','%s')" %(subject,description)
		insert(q)
		return redirect(url_for('admin.manage_subjects'))
		
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action='none'
	if action=='delete':
		q="DELETE  FROM subjects WHERE subject_id='%s'"%(id)
		delete(q)
		return redirect(url_for('admin.manage_subjects'))
	if action =='update':
		q="SELECT * FROM subjects WHERE subject_id='%s'"%(id)
		res=select(q)
		data['updatesubject']=res
	if 'update' in request.form:
		subject=request.form['subs']
		description=request.form['Descriptions']
		q="UPDATE subjects set subject_title='%s',description='%s' where subject_id='%s'"%(subject,description,id)
		update(q)
		return redirect(url_for('admin.manage_subjects'))
	return render_template('manage_subjects.html',data=data)


@admin.route('/manage_tutors',methods=['get','post'])
def manage_tutors():
	data={}
	q="SELECT *,CONCAT(first_name,'',last_name)AS name FROM tutors"
	res=select(q)
	data['tutors']=res
	
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action='none'
	if action=='delete':
		q="DELETE FROM login WHERE login_id=(SELECT login_id FROM tutors WHERE tutor_id='%s')"%(id)
		delete(q)
		q="DELETE FROM tutors WHERE tutor_id='%s'"%(id)
		delete(q)
		return redirect(url_for('admin.manage_tutors'))
	if action=='update':
		q="SELECT * FROM tutors WHERE tutor_id='%s'"%(id)
		res=select(q)
		data['tutorupdate']=res

	if 'tutorup' in request.form:
		first_name=request.form['fnames']
		last_name=request.form['lnames']
		qualification=request.form['qualifications']
		phone=request.form['phones']
		email=request.form['emails']
		q="UPDATE tutors SET first_name='%s',last_name='%s',qualification='%s',phone='%s',email='%s' WHERE tutor_id='%s'"%(first_name,last_name,qualification,phone,email,id)
		update(q)
		return redirect(url_for('admin.manage_tutors'))

	if 'tutor' in request.form:
		first_name=request.form['fname']
		last_name=request.form['lname']
		qualification=request.form['qualification']
		phone=request.form['phone']
		email=request.form['email']
		username=request.form['username']
		password=request.form['password']
		q="INSERT INTO login VALUES (NULL,'%s','%s','tutor')"%(username,password)
		ids=insert(q)
		q="INSERT INTO tutors VALUES(NULL,'%s','%s','%s','%s','%s','%s')"%(ids,first_name,last_name,qualification,phone,email)
		insert(q)
		return redirect(url_for('admin.manage_tutors'))

	return render_template('manage_tutors.html',data=data)

@admin.route('view_reviews',methods=['get','post'])
def reviews():
	data={}
	q="SELECT *,CONCAT(`first_name`,' ',`last_name`)AS NAME FROM reviews INNER JOIN users USING(user_id)"
	res=select(q)
	data['reviews']=res
	return render_template('view_reviews.html',data=data)

@admin.route('/view_search_keywords',methods=['get','post'])
def searchkeyword():
	data={}
	q="SELECT *,CONCAT((first_name,' ',last_name)AS NAME FROM searchhistory INNER JOIN users USING(user_id)"
	return render_template('view_search_keywords.html',data=data)


@admin.route('/view_keyword_rankings',methods=['get','post'])
def keywordranking():
	data={}
	q="SELECT * FROM keywords ORDER BY(ranking)"
	res=select(q)
	data['keywords']=res
	return render_template('view_keyword_rankings.html',data=data)



	


