class User < ActiveRecord::Base
  rolify
  include SimplestAuth::Model
      
  authenticate_by :email
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?

  def admin=(bool)
    self.add_role :admin if bool
  end

  def is_admin?
    self.has_role? :admin
  end
end
