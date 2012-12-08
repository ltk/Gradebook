class Teacher < User
  scope :not_in, lambda { |course| order('last_name ASC').where('id not in (?)', course.teachers.map { |s| s.id } ) }

  def course_history(current_semester)
    self.sort_memberships_by_semester(current_semester, self.teaching_assignments.includes(:course => :semester))
  end
end