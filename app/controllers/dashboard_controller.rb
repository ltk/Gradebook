class DashboardController < ApplicationController
  before_filter :login_required
  before_filter :redirect_admins
  before_filter :set_current_semester

  def index
    @semesters = [];
    @courses  = { :current => {}, :future => {}, :past => {} }
    @gpas = {}

    current_user.enrolled_courses.includes(:semester, :enrollments).order().collect do |course|
      @semesters << course.semester
      if( course.for_semester(@semester) )
        if @courses[:current][@semester]
          @courses[:current][@semester] << course
        else
          @courses[:current][@semester] = [course]
        end
      elsif( course.semester.start_date < @semester.start_date )
        if @courses[:past][course.semester]
          @courses[:past][course.semester] << course
        else
          @courses[:past][course.semester] = [course]
        end 
      else
        if @courses[:future][course.semester]
          @courses[:future][course.semester] << course
        else
          @courses[:future][course.semester] = [course]
        end 
      end
    end

    @semesters.each do |semester|
      @gpas[semester] = current_user.gpa(semester) unless @courses[:future].has_key? semester
    end
    
    @gpas[:overall] = current_user.gpa
  end

  private

  def redirect_admins
    redirect_to admin_dashboard_path if current_user.is_admin?
  end

  def set_current_semester
    @semester = Semester.current.find(:first)
  end

end
