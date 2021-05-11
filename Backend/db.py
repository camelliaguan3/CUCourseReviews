from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Course(db.Model):
  __tablename__ = 'course'
  id = db.Column(db.Integer, primary_key = True)
  prefix = db.Column(db.String, nullable=False)
  code = db.Column(db.Integer, nullable=False)
  name = db.Column(db.String, nullable=False)
  reviews = db.relationship('Review', cascade='delete')
  rating = db.Column(db.Integer, nullable=False)
  hours_per_week = db.Column(db.Integer, nullable=False)

  def __init__(self, **kwargs): 
    self.prefix = kwargs.get('prefix')
    self.code = kwargs.get('code')
    self.name = kwargs.get('name')
    self.reviews = []
    self.rating = 0 
    self.hours_per_week = 0
  
  def serialize(self):
    return {
      "id": self.id,
      "prefix": self.prefix, 
      "code": self.code, 
      "name": self.name,
      "reviews": [r.serialize() for r in self.reviews],
      "rating": self.rating, 
      "hours_per_week": self.hours_per_week
    }

class Review(db.Model): 
  __tablename__ = 'review'
  id = db.Column(db.Integer, primary_key = True)
  student_name= db.Column(db.String)
  course_id = db.Column(db.Integer, db.ForeignKey('course.id'))
  rating = db.Column(db.Integer, nullable=False)
  review = db.Column(db.String, nullable=False)
  # hours_per_week = nullable??
  hours_per_week = db.Column(db.Integer, nullable=False)

  def __init__(self, **kwargs):
    self.student_name = kwargs.get('student_name')
    self.course_id = kwargs.get('course_id')
    self.rating = kwargs.get('rating')
    self.review = kwargs.get('review')
    self.hours_per_week = kwargs.get('hours_per_week')

  def serialize(self): 
    return {
      "id": self.id,
      "student_name": self.student_name, 
      "rating": self.rating, 
      "review": self.review,
      "hours_per_week": self.hours_per_week
    }