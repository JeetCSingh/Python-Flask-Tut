from flask import Flask,render_template,request, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail

with open('config.json' , 'r') as c :
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465' ,
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)

mail = Mail(app)
#app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://username:password@localhost/db_name"
if(local_server) :
    app.config["SQLALCHEMY_DATABASE_URI"] = params["local_uri"]
else :
    app.config["SQLALCHEMY_DATABASE_URI"] = params["prod_uri"]

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12), unique=True, nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(25), unique=True, nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=False)



@app.route("/")
def home() :
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', params=params , posts = posts)

@app.route("/dashboard")
def dashboard() :
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('dashboard.html', params=params , posts = posts)

@app.route("/about")
def about() :
    return render_template('about.html' , params=params)

@app.route("/add", methods=['GET', 'POST'])
def add() :
    if request.method == 'POST' :
        box_title = request.form.get('title')
        tline = request.form.get('tline')
        slug = request.form.get('slug')
        content = request.form.get('content')
        post = Posts(title=box_title, tagline=tline, slug=slug, content=content, date=datetime.now())
        db.session.add(post)
        db.session.commit()
    return render_template('add.html' , params = params)

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno) :
    post = Posts.query.filter_by(sno=sno).first()
    db.session.delete(post)
    db.session.commit()
    return redirect('/dashboard')



@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug) :
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html' , params=params, post = post)

@app.route("/contact" , methods = ['GET','POST'])
def contact() :
    if(request.method =='POST') :
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('msg')

        entry = Contacts(name = name, phone_num = phone, mes = message, email = email, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            'New message from '+ name ,
            sender = email,
            recipients = [params['gmail-user']],
            body = message +"\n"+ phone

        )
    return render_template('contact.html' , params=params)

app.run(debug=True)