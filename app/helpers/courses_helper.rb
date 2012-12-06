module CoursesHelper
  def grade_selector(form_builder)
    form_builder.input :grade, :collection => { "A+" => 4.00, "A" => 4.00, "A-" => 3.70, "B+" => 3.30, "B" => 3.00, "B-" => 2.70, "C+" => 2.30, "C" => 2.00, "C-" => 1.70, "D+" => 1.30, "D" => 1.00, "D-" => 0.70, "F" => 0.00 }
  end
end
