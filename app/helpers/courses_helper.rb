module CoursesHelper
  def grade_selector(form_builder, label = 'Grade')
    form_builder.input :grade, :collection => Grade.letter_grade_hash, :label => label
  end
end
