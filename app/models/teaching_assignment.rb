class TeachingAssignment < ActiveRecord::Base
  attr_accessible :course_id, :teacher_id

  belongs_to :course, :counter_cache => true
  belongs_to :user, :foreign_key => :teacher_id

  validates_uniqueness_of :teacher_id, :scope => :course_id
  validates_presence_of :user
  validates_presence_of :course
end
