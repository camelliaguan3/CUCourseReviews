# initial app.py, not finished. added get course routes for midpoint submission. will implement create courses.
import os
import json
from db import db
from db import Course, Review
from flask import Flask
from flask import request
import requests

app = Flask(__name__)
db_filename = "cucoursereview.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()


def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code

def failure_response(error, code=404):
    return json.dumps({"success": False, "error": error}), code

# how to encorporate this into our database? Would it be better to call in get? post? When should this be called?
def parse_class_api(prefix, code = ''):
    if code == '':
        codes = ''
    else:
        codes = '&q=' + str(code)
    
    r_str = 'https://classes.cornell.edu/api/2.0/search/classes.json?roster=SP21&subject=' + str(prefix) + codes
    r = requests.get(r_str).json()

    if r.get("status") == "error":
        return None

    data = r.get('data')
    if data is None:
        return None

    classes = data.get('classes')
    if classes is None:
        return None

    new_courses = []
    for c in classes:
        prefix = c.get('subject')
        code = c.get('catalogNbr')
        name = c.get('titleLong')

        if prefix is None or code is None or name is None:
            return None

        new_courses.append({'prefix': prefix, 'code': int(code), 'name': name})

    return new_courses

def add_course(body): # use preexisting database or create our own with some way to get all the courses
    prefix = body.get('prefix')
    code = body.get('code')
    name = body.get('name')

    new_course = Course(prefix=prefix, code=code, name=name)
    in_db = Course.query.filter_by(prefix=prefix, code=code, name=name)

    if in_db is None:
        db.session.add(new_course)
        db.session.commit()
        return success_response(new_course.serialize(), 201)

@app.route("/")
@app.route("/api/courses/")
# Returns dictionary of all courses (for testing purposes)
def get_courses():
    return success_response([c.serialize() for c in Course.query.all()])

@app.route("/api/courses/<int:course_id>/")
# Returns dictionary of course with course_id (for testing purposes)
def get_course_by_id(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found.")

    return success_response(course.serialize())

@app.route("/api/course")
# Returns dictionary of all courses with a code (not required) and prefix (required)
def get_course():
    p = request.args.get('prefix', '')
    c = request.args.get('code', '')

    # prefix is required
    if p == '': 
        return failure_response("No prefix specified.")

    # if the courses don't exist in the database
    course = parse_class_api(p, c)

    if course is None: # if the course has invalid arguments
        return failure_response("Invalid arguments.")
    
    # create new courses if there aren't any in the database (will not add courses if they exist)
    for i in course:
        add_course(i)

    course_list = []
    # get all of the courses from the db (should have existed already or have been added earlier)
    if c == '':
        courses = Course.query.filter_by(prefix=p)
    else: 
        courses = Course.query.filter_by(prefix=p, code=c)
    
    for i in courses:
        course_list.append(i.serialize())

    return success_response(course_list)

@app.route("/api/courses/", methods=["POST"])
def create_course():
    body = json.loads(request.data) 
    prefix = body.get('prefix')
    code = body.get('code')
    name = body.get('name')

    if code is None or prefix is None:
        return failure_response("No code or prefix specified.", 400)
        
    new_course = Course(code=code, prefix=prefix, name=name)
    db.session.add(new_course)
    db.session.commit()
    return success_response(new_course.serialize(), 201)

if __name__ == "__main__":
    #port = int(os.environ.get("PORT", 5000))
    #app.run(host="0.0.0.0", port=port)
    app.run(host="0.0.0.0", port=5000, debug=True)