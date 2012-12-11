class User < ActiveRecord::Base
  include SimplestAuth::Model
  has_many :enrollments, :dependent => :destroy
  has_many :enrolled_courses, :through => :enrollments, :source => :course

  has_many :teaching_assignments, :foreign_key => :teacher_id, :dependent => :destroy
  has_many :taught_courses, :through => :teaching_assignments, :source => :course

  authenticate_by :email
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, :email_format => {:message => 'is not a valid email address'}

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?

  validates :type, :inclusion => { :in => ['Administrator', 'Student', 'Teacher'], :message => "%{value} is not a valid user type" }
  
  scope :by, lambda { |attribute| order( attribute + ' ASC') }

  self.per_page = 20

  def self.to_s
    "User"
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

  def sort_memberships_by_semester(current_semester, course_memberships)
    data = { :semesters => [], :course_memberships => { :current => {}, :future => {}, :past => {} } }
    course_memberships.each do |course_membership|
      data[:semesters] << course_membership.course.semester
      if( course_membership.course.for_semester(current_semester) )
        if data[:course_memberships][:current][current_semester]
          data[:course_memberships][:current][current_semester] << course_membership
        else
          data[:course_memberships][:current][current_semester] = [course_membership]
        end
      elsif( course_membership.course.semester.start_date < current_semester.start_date )
        if data[:course_memberships][:past][course_membership.course.semester]
          data[:course_memberships][:past][course_membership.course.semester] << course_membership
        else
          data[:course_memberships][:past][course_membership.course.semester] = [course_membership]
        end 
      else
        if data[:course_memberships][:future][course_membership.course.semester]
          data[:course_memberships][:future][course_membership.course.semester] << course_membership
        else
          data[:course_memberships][:future][course_membership.course.semester] = [course_membership]
        end 
      end
    end
    data
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
