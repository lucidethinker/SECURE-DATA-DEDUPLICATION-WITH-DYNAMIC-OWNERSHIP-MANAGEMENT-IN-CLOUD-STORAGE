from flask import *
from database import *
import uuid
import DataDuplication as dd
import base64
from werkzeug.utils import secure_filename
user=Blueprint('user',__name__)

@user.route('/user_home',methods=['get','post'])
def user_home():

	return render_template("user_home.html")

@user.route('/user_search_materials',methods=['get','post'])
def user_search_materials():
	data={}
	if 'tosearch'in  request.form:
		search=request.form['search']
		cbnggbv=search+'%'
	
		q="SELECT * FROM `materials` INNER JOIN `material_keyword` USING(`material_id`) INNER JOIN `keywords` USING(`keyword_id`) WHERE `keyword` LIKE '%s'"%(cbnggbv)
		res=select(q)
		data['materials']=res
		print(res)

		q="SELECT * FROM keywords WHERE keyword like'%s'"%(cbnggbv)
		res=select(q)
		keyword_id=res[0]['keyword_id']

		no_of_hits=res[0]['no_of_hits']
		no_of_hits=int(no_of_hits)+1
		print(no_of_hits)
		q="UPDATE keywords SET no_of_hits='%s' WHERE keyword_id='%s'"%(no_of_hits,keyword_id) 
		update(q)
		print(q)
		print(res)
		q="SELECT * FROM `keywords` ORDER BY `no_of_hits` DESC"
		res=select(q)
		for i in range(len(res)):
			key_id=res[i]['keyword_id']
			
			print(key_id)
			
			count=1+i
			print(count)

			q="UPDATE `keywords` SET `ranking`='%s' WHERE `keyword_id`='%s'"%(count,key_id)
			update(q)
			print(q)
		if 'id' in request.args:
			id=request.args['id']
			q="select no_of_downloads from materials where material_id='%s'"%(id)
			res=select(q)
			print(res[0]['no_of_downloads'])
			if res[0]['no_of_downloads']=="none":
				download=0
			download=int(download)+1
			
			q="UPDATE `materials` SET `no_of_downloads`='%s'  where material_id='%s'"%(download,id)
			update(q)


			return redirect(url_for('user.user_search_materials'))
	return render_template("user_search_materials.html",data=data)
@user.route('/user_view_comments',methods=['get','post'])
def user_view_comments():
	data={}
	
	if 'id' in request.args:
		id=request.args['id']
		q="SELECT * FROM `comments` WHERE `material_id`='%s'"%(id)
		res=select(q)
		data['comments']=res
	if 'com' in request.form:
		id=request.args['id']
		login_id=session['log_id']
		comment=request.form['comment']
		q="INSERT INTO `comments` VALUES(NULL,'%s',(SELECT `user_id` FROM `users` WHERE `login_id`='%s'),'%s','Not',CURDATE())"%(id,login_id,comment)
		insert(q)
		return redirect(url_for('user.user_view_comments',id=id))

	return render_template("user_view_comments.html",data=data)

@user.route('/user_review',methods=['get','post'])
def user_review():
	if 'rev' in request.form:
		login_id=session['log_id']
		review=request.form['review']
		q="INSERT INTO `reviews` VALUES(NULL,(SELECT `user_id` FROM `users` WHERE `login_id`='%s'),'%s',CURDATE())"%(login_id,review)
		insert(q)

	return render_template("user_review.html")


@user.route('/download')
def download():
    materialid = request.args['materialid']
    data,filename = dd.download(materialid)
    fh1 = open(filename, "wb")
    fh1.write(base64.b64decode(data))
    fh1.close()
    file = open(filename, "rb")
    data = file.read()
    print(filename)
    return Response(data,
                    mimetype="text/plain",
                    headers={"Content-Disposition":
                                 "attachment;filename=%s" % filename})