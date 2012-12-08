class Student < User
  scope :not_in, lambda { |course| order('last_name ASC').where('id not in (?)', course.students.map { |s| s.id } ) }

  def course_history(current_semester)
    data = self.sort_memberships_by_semester(current_semester, self.enrollments.includes(:course => :semester))
    data[:gpas] = self.gpas_from_semesters(data[:semesters])
    data[:gpas][:overall] = self.gpa
    data
  end

  def gpas_from_semesters(semesters)
    gpas = {}
    semesters.each do |semester|
      gpas[semester] = self.gpa(semester)
    end
    gpas
  end

  def gpa(semester = nil)
    self.enrolled_courses.for_semester(semester).average('grade')
  end
end