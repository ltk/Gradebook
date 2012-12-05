class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name

  has_many :enrollments
  has_many :students, :through => :enrollments
end
