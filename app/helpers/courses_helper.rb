module CoursesHelper
  def grade_selector(form_builder)
    form_builder.input :grade, :collection => grades_hash
  end
end
