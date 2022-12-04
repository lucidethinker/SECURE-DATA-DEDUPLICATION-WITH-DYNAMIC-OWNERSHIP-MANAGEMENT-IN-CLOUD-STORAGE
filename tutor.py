from flask import *
from database import *
from functions import*
import uuid
import DataDuplication as dd
import base64
from werkzeug.utils import secure_filename

tutor=Blueprint('tutor',__name__)

@tutor.route('/tutorhome',methods=['get','post'])
def tutorhome():
	return render_template('tutorhome.html')

@tutor.route('/tutormanagestudymaterials',methods=['get','post'])
def tutormanagestudymaterials():
	data={}
	value=""
	key="hellloooooooooo"
	q="select * from subjects"
	res=select(q)
	data['subjects']=res

	if 'materials' in request.form:
		key="haiiiiii"
		login_id=session['log_id']
		subject_id=request.form['subject_id']
		title=request.form['title']
		image=request.files['image']
		path='static/images/'+str(uuid.uuid4())+image.filename
		image.save(path)
		print(path)
		
		# fn=secure_filename(image.filename)
		# image.save('./static/temp/'+fn)
		# with open('./static/temp/'+fn, "rb") as imageFile:
		

		splitpath=path.split('.')
		types=splitpath[1]
		if types=='txt':
			value=txtreader(path)
		if types=='docx':
			value=docreader(path)
		if types=='pdf':
			value=pdfreader(path)
		

		splitvalue=value.split(' ')
		print(splitvalue)
		stopwords=['am','i','me','my','myself','we','our','ours','ourselves','you','your','yours','yourself','yourselves','he','him','his','himself','she','her','hers','herself','it','its','itself','they','them','their','theirs','themselves','what','which','who','whom','this','that','these','those','am','is','are','was','were','be','been','being','have','has','had','having','do','does','did','doing','a','an','the','and','but','if','or','because','as','until','while','of','at','by','for','with','about','against','between','into','through','during','before','after','above','below','to','from','up','down','in','out','on','off','over','under','again','further','then','once','here','there','when','where','why','how','all','any','both','each','few','more','most','other','some','such','no','nor','not','only','own','same','so','than','too','very','s','t','can','will','just','don','should','now']
		
		result = ""

		for i in splitvalue:
			i = i.strip();
			if i in stopwords:
				pass
			else:
				result = result + " "+i
				
					
		print("result is:",result)
		print(len(result))
		splitresult=result.split(' ')
		print(splitresult)
		print(len(splitresult))
		
		with open(path, "rb") as imageFile:
		    data = base64.b64encode(imageFile.read()).decode('utf-8')
		# data = file.read()
		# ids=dd.upload (data, image.filename,login_id,subject_id,title)
		ids=dd.upload (data, path,login_id,subject_id,title)
		print(ids)

		for i in range(1,len(splitresult)):
			q="insert into `keywords` values(null,'%s','0','0')"%(splitresult[i])
			print(q)
			ida=insert(q)
			q="INSERT INTO `material_keyword` VALUES(NULL,'%s','%s')"%(ida,ids)
			print(q)
			insert(q)

		return redirect(url_for('tutor.tutormanagestudymaterials'))
	return render_template('tutor_manage_study_materials.html',data=data)

@tutor.route('/tutorviewcomments',methods=['get','post'])
def tutorviewcomments():
	data={}
	login_id-=session['log_id']
	q="SELECT *,CONCAT(first_name,' ',last_name)AS NAME FROM comments INNER JOIN materials USING(materials)"
	res=select(q)
	data['comments']=res
	j=0
	for i in range(1,len(res)+1):
		print('submit'+str(i))
		if 'submit'+str(i) in request.form:
			reply=request.form['reply'+str(i)]
			print(res[j][comment_id])
			q="UPDATE comments SET reply='%s'WHERE comment_id='%s'"%(reply,res[j]['comment_id'])
			update(q)
			return redirect(url_for('tutor.tutorviewcomments'))
		j=j-1
	return render_template('tutor_view_comments.html',data=data)

@tutor.route('/tutorviewdownloads',methods=['get','post'])
def tutorviewdownloads():
	data={}
	login_id=session['log_id']
	q="SELECT * FROM materials WHERE tutor_id=(SELECT tutor_id FROM  tutors WHERE login_id='%s')"%(login_id)
	res=select(q)
	data['materials']=res
	return render_template('tutor_view_downloads.html',data=data)


@tutor.route('/tutorviewrating',methods=['get','post'])
def tutorviewrating():
	data={}
	if 'id' in request.form:
		q="SELECT * FROM material_keyword INNER JOIN keywords USING(keyword_id) WHERE material_id='%s' ORDER BY ranking DESC"%(id)
		res=select(q)
		data['rankings']=res
		print(res)
	return render_template('tutor_view_ranking.html',data=data)

@tutor.route('/viewcomments',methods=['get','post'])
def viewcomments():
	data={}
	login_id=session['log_id']
	q="SELECT * FROM `materials` where tutor_id=(SELECT `tutor_id` FROM `tutors` WHERE `login_id`='%s')"%(login_id)
	res=select(q)
	data['viewcmnt']=res
	j=0
	for i in range(1,len(res)+1):
		print('submit'+str(i))
		if 'submit' +str(i) in request.form:
			reply=request.form['reply'+str(i)]
			print(reply)
			print(j)
			print(res[j]['comment_id'])
			q="update comments set reply='%s'"%(reply,res[j]['comment_id'])
			print(q)
			update(q)
			return redirect(url_for('tutor. viewcomments'))
		j=j+1
	return render_template('tutor_view_comments.html',data=data)


