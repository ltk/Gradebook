class Semester < ActiveRecord::Base
  attr_accessible :courses_count, :end_date, :name, :start_date

  validates_presence_of :end_date
  validates_presence_of :start_date
  validates_presence_of :name
  has_many :courses

  scope :current, lambda { where("start_date <= ?", Date.today).where("end_date >= ?", Date.today)}

  self.per_page = 20
end
