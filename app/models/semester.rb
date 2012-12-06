class Semester < ActiveRecord::Base
  attr_accessible :courses_count, :end_date, :name, :start_date
end
