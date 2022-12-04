import os
from CustomHash import encrypt,decrypt,create_key
from flask import current_app as app
from werkzeug.utils import secure_filename
import  database as db
import hashlib
from database import *
import base64
import  uuid
from shutil import copyfile
from datetime import datetime,timedelta

def create_tag(data):
    tag = hashlib.sha512(hashlib.sha512(data.encode("ascii")).hexdigest().encode("ascii")).hexdigest()
    return tag

def upload(data,name,login_id,subject_id,title):
    # print(data)
    unique = str(uuid.uuid4())
    # filename =  "static/uploads" + "/" + secure_filename(unique + "." + name.split(".")[-1])
    # print("files"+filename)
    key = None
    key = str(create_key())
    enc_text = encrypt(data, key)


    fh = open(name, "wb")
    fh.write(base64.b64decode(enc_text))
    fh.close()
    # q="insert into downloadedfile values(null,'%s','%s','%s','%s')" %(fid,filename,name,key)
    # insert(q)
    # q="update filetodownload set status='downloaded' where file_id='%s'" %(fid)
    # # print("dgdghdgfh",q)
    # update(q)
    q="INSERT INTO materials VALUES(NULL,(SELECT tutor_id FROM tutors WHERE login_id='%s'),'%s','%s','%s',CURDATE(),'none','%s')"%(login_id,subject_id,title,name,key)
    ids=insert(q)
    print(q)
    
    return ids



def download(file_id):
    q = "select * from materials where material_id = '%s'" %(file_id)
    res = db.select(q)
    key = res[0]['key']
    # file = open(res[0]['file_path'],"r")
    with open(res[0]['file_path'], "rb") as imageFile:
        data = base64.b64encode(imageFile.read()).decode('utf-8')
    # data= file.read()
    data = decrypt(data,key)
    return data, os.path.basename(res[0]['file_path'])
