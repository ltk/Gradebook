class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name, :enrollments_attributes, :teaching_assignments_attributes, :semester_id

  has_many :enrollments, :dependent => :destroy
  has_many :teaching_assignments, :dependent => :destroy
  has_many :students, :through => :enrollments, :source => :user, :uniq => true
  has_many :teachers, :through => :teaching_assignments, :source => :user, :uniq => true
  belongs_to :semester, :counter_cache => true

  accepts_nested_attributes_for :enrollments, :allow_destroy => true
  accepts_nested_attributes_for :teaching_assignments, :allow_destroy => true
end
