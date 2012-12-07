class ApplicationController < ActionController::Base
  protect_from_forgery

  include SimplestAuth::Controller

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to dashboard_path, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  private

  def set_current_semester
    @current_semester = Semester.current.find(:first)
  end

end
