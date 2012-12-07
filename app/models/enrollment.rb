class Enrollment < ActiveRecord::Base
  attr_accessible :course_id, :grade, :semester_id, :user_id

  belongs_to :course, :counter_cache => true
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :course_id
  validates_presence_of :user
  validates_presence_of :course
end
