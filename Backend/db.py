from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Course(db.Model):
  __tablename__ = 'course'
  id = db.Column(db.Integer, primary_key = True)
  prefix = db.Column(db.String, nullable=False)
  code = db.Column(db.Integer, nullable=False)
  reviews = db.relationship('Review', cascade='delete')
  # ratings associated with review figure this out in reviews class...will ratings be a variable
  # since it is already included in the reviews for this course? 

  def __init__(self, **kwargs): 
    self.prefix = kwargs.get('prefix')
    self.code = kwargs.get('code')
    self.reviews = []
  
  def serialize(self):
    return {
      "id": self.id,
      "prefix": self.prefix, 
      "code": self.code, 
      "reviews": [r.serialize() for r in self.reviews]
    }

class Review(db.Model): 
  __tablename__ = 'review'
  id = db.Column(db.Integer, primary_key = True)
  # nullable=True ??
  student_name= db.Column(db.String)
  course_id = db.Column(db.Integer, db.ForeignKey('course.id'))
  rating = db.Column(db.Integer, nullable=False)
  # hours_per_week = nullable??
  hours_per_week = db.Column(db.Integer, nullable=False)

  def __init__(self, **kwargs):
    self.student_name = kwargs.get('student_name')
    self.course_id = kwargs.get('course_id')
    self.rating = kwargs.get('rating')
    self.hours_per_week = kwargs.get('hours_per_week')

  def serialize(self): 
    return {
      "id": self.id,
      "student_name": self.student_name, 
      "course": self.course_id, 
      "rating": self.rating, 
      "hours_per_week": self.hours_per_week
    }
