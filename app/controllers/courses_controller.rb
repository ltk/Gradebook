class CoursesController < ApplicationController
  authorize_resource
  before_filter :set_semester
  # GET /courses
  # GET /courses.json
  def index
    if current_user.is_a? Teacher
      @courses = Course.for_semester(@semester).includes(:semester, :teaching_assignments).page(params[:page]).order('name ASC')
    else
      @courses = Course.for_semester(@semester).includes(:semester).page(params[:page]).order('name ASC')
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.includes(:teachers, :students).find(params[:id])
    current_user_enrollment = @course.enrollments.where(:user_id => current_user.id).first
    @grade = Grade.new(current_user_enrollment.grade) if current_user_enrollment
    @average_grade = Grade.new(@course.average_gradepoint) if can? :manage, @course

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @semester ? semester_course_path(@semester, @course) : @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    invalid_redirect_action = updating_course_info?(params[:course]) ? "edit" : "show"

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: invalid_redirect_action }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
  def updating_course_info?(hash) 
    hash.has_key?(:name) || hash.has_key?(:description) || hash.has_key?(:code)
  end

  def set_semester
    @semester = Semester.find(params[:semester_id]) if params[:semester_id]
  end
end
