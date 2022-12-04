from flask import Flask
from public import public
from admin import admin
from tutor import tutor
from user import user


app=Flask(__name__)
app.secret_key="jjj"

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(tutor,url_prefix='/tutor')
app.register_blueprint(user,url_prefix='/user')



app.run(debug=True,port=5000)