class User < ActiveRecord::Base
  include SimplestAuth::Model

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

  def is_admin?
    false
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
