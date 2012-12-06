class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name, :enrollments_attributes, :teaching_assignments_attributes

  has_many :enrollments
  has_many :teaching_assignments
  has_many :users, :through => :enrollments
  has_many :users, :through => :teaching_assignments

  accepts_nested_attributes_for :enrollments, :allow_destroy => true
  accepts_nested_attributes_for :teaching_assignments, :allow_destroy => true
end
