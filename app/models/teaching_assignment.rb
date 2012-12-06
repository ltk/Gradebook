class TeachingAssignment < ActiveRecord::Base
  attr_accessible :course_id, :semester_id, :teacher_id

  belongs_to :course, :counter_cache => true
  belongs_to :user, :foreign_key => :teacher_id
end