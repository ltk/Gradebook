class Enrollment < ActiveRecord::Base
  attr_accessible :course_id, :grade, :semester_id, :user_id

  belongs_to :course
  belongs_to :user
  # has_one :semester
end
