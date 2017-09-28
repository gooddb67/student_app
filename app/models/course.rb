class Course < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :subject, presence: true
  validate :course_names

  def course_names
      courses = ["Love", "Romance", "Sex"]
      if self.subject
        courses.each do |course|
          if self.subject.include?(course)
            return
          end
        end
        # the loop has finished iterating and has not returned. Therefore no element from courses is present in the subject. As such, we push the error into the Course subject field.
        self.errors[:subject] << "MUST contain a romance word."
      end
    end



end
