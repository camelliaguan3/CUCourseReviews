# initial app.py, not finished. only thing that does not work is adding courses from Class Roster API into database
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

# Parses courses to the format of the database
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
# Returns dictionary of all courses (used for testing - the user cannot use this route)
def get_courses():
    return success_response([c.serialize() for c in Course.query.all()])

@app.route("/api/courses/<int:course_id>/")
# Returns dictionary of course with course_id
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
# Creates a course (used for testing - the user cannot use this route)
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

@app.route("/api/<int:course_id>/reviews/")
# Returns all reviews for a particular course
def get_reviews_of_course(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None: 
        return failure_response("Course not found.")
    return success_response([r.serialize() for r in course.reviews])

@app.route("/api/<int:course_id>/reviews/", methods=["POST"])
# Allows user to create a review for a particular course
# Whenever a review is added, the average rating for that course is updated too
# Whenever a review is added, the average hours per week for that course is updated too
def create_review(course_id): 
    course = Course.query.filter_by(id=course_id).first()
    if course is None: 
        return failure_response("Course not found.")
    body = json.loads(request.data)
    new_review = Review(
        student_name = body.get('student_name', 'Anonymous'), 
        course_id = course_id, 
        rating = body.get('rating'), 
        review = body.get('review'), 
        hours_per_week = body.get('hours_per_week')
    )
    db.session.add(new_review)
    db.session.commit()
    course.rating = get_avg_rating(course_id)
    course.hours_per_week = get_avg_hours(course_id)
    db.session.commit()
    return success_response(new_review.serialize())

# Calculates the average rating of the course based off all the reviews
def get_avg_rating(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found.")

    reviews = [r.serialize() for r in course.reviews]
    ratings = []
    for r in reviews: 
        rating = r.get('rating')
        ratings.append(rating)

    number_of_ratings = 0
    sum = 0
    for i in ratings: 
        sum += i
        number_of_ratings += 1

    avg_rating = sum / number_of_ratings
    return avg_rating

# Calculates the average hours per week of the course based off all the reviews
def get_avg_hours(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found.")

    reviews = [r.serialize() for r in course.reviews]
    hours=[]
    for r in reviews: 
        hours_per_week = r.get('hours_per_week')
        hours.append(hours_per_week)

    number_of_people=0
    sum = 0
    for i in hours: 
        sum += i
        number_of_people += 1

    avg_hours = sum / number_of_people
    return avg_hours

if __name__ == "__main__":
    #port = int(os.environ.get("PORT", 5000))
    #app.run(host="0.0.0.0", port=port)
    app.run(host="0.0.0.0", port=5000, debug=True)

# create review, get review
# create route that takes average of the ratings
# incorporating stuff from API into our database
# if the course isnt in the database, you add it to it else don't do anything