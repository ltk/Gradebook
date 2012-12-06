class Dashboard
  attr_reader :data

  def initialize(user, current_semester)
    
    case user.type
    when 'Administrator'

    when 'Teacher'
      initialize_data_for_teacher(user, current_semester)
    when 'Student'
      initialize_data_for_student(user, current_semester)
    end
  end
  
  private

  def initialize_data_for_student(student, current_semester)
    @data = student.course_history(current_semester)
  end

  def initialize_data_for_teacher(teacher, current_semester)
    @data = teacher.course_history(current_semester)
  end
end
