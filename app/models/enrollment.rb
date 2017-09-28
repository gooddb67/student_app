class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  attr_reader :student_name, :course_name

  def student_name=(name)
    self.student = Student.find_or_create_by(name: name)
  end

  def course_name=(name)
    self.course = Course.find_or_create_by(subject: name)
  end

end
