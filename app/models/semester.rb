class Semester < ActiveRecord::Base
  attr_accessible :courses_count, :end_date, :name, :start_date

  scope :current, lambda { where("start_date <= ?", Date.today).where("end_date >= ?", Date.today)}

  self.per_page = 20
end
