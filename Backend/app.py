# initial app.py, not finished. added get course routes for midpoint submission. will implement create courses.
import os
import json
from db import db
from db import Course, Review
from flask import Flask
from flask import request

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

@app.route("/")
@app.route("/api/courses/")
# Returns dictionary of all courses
def get_courses():
    return success_response([c.serialize() for c in Course.query.all()])

@app.route("/api/courses/<int:course_id>/")
# Returns dictionary of course with course_id
def get_course_by_id(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found.")

    return success_response(course.serialize())

@app.route("/api/courses/<int:prefix_id>/")
# Returns dictionary of all courses with the prefix of prefix_id
def get_course_by_prefix(prefix_id):
    course = Course.query.filter_by(prefix=prefix_id)  
    if course is None:
        return failure_response("Course not found.")
    
    courses = []
    for i in course:
        courses += course.serialize()

    return success_response(course.serialize())

@app.route("/api/courses/<int:code_id>/")
# Returns dictionary of all courses with the code of code_id
def get_course_by_code(code_id):
    course = Course.query.filter_by(code=int(code_id))
    if course is None:
        return failure_response("Course not found.")

    courses = []
    for i in course:
        courses += course.serialize()

    return success_response(courses)

@app.route("/api/courses/", methods=["POST"])
def create_course(): # use preexisting database or create our own with some way to get all the courses
    body = json.loads(request.data)
    name = body.get('name')
    prefix = body.get('prefix')

    code = body.get('code')

    if code is None or name is None:
        return failure_response("No code or name specified.", 400)
        
    new_course = Course(code=code, name=name)
    db.session.add(new_course)
    db.session.commit()
    return success_response(new_course.serialize(), 201)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
