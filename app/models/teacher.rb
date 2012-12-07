class Teacher < User
  scope :not_in, lambda { |course| order('last_name ASC').where('id not in (?)', course.teachers.map { |s| s.id } ) }

  def course_history(current_semester)
    data = { :semesters => [], :courses => { :current => {}, :future => {}, :past => {} } }

    self.taught_courses.includes(:semester).collect do |course|
      data[:semesters] << course.semester
      if( course.for_semester(current_semester) )
        if data[:courses][:current][current_semester]
          data[:courses][:current][current_semester] << course
        else
          data[:courses][:current][current_semester] = [course]
        end
      elsif( course.semester.start_date < current_semester.start_date )
        if data[:courses][:past][course.semester]
          data[:courses][:past][course.semester] << course
        else
          data[:courses][:past][course.semester] = [course]
        end 
      else
        if data[:courses][:future][course.semester]
          data[:courses][:future][course.semester] << course
        else
          data[:courses][:future][course.semester] = [course]
        end 
      end
    end

    data

  end
end