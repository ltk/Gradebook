class User < ActiveRecord::Base
  include SimplestAuth::Model
  has_many :enrollments
  has_many :enrolled_courses, :through => :enrollments, :source => :course

  has_many :teaching_assignments, :foreign_key => :teacher_id
  has_many :taught_courses, :through => :teaching_assignments, :source => :course

  authenticate_by :email
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?

  validates :type, :inclusion => { :in => ['Administrator', 'Student', 'Teacher'], :message => "%{value} is not a valid user type" }
  
  def self.to_s
    "User"
  end

  def gpa
    self.enrollments.inject { |sum,enrollment| enrollment.grade }
  end

  def is_admin?
    false
  end

  def full_name
    "#{self.first_name if self.first_name} #{self.last_name if self.last_name}"
  end
  
  def to_s
    self.full_name
  end

  def self.child_classes
    ['Administrator', 'Student', 'Teacher']
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end
end
