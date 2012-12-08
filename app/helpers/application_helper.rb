module ApplicationHelper
  # def grades_hash
  #   { "A+" => 4.30, "A" => 4.00, "A-" => 3.70, "B+" => 3.30, "B" => 3.00, "B-" => 2.70, "C+" => 2.30, "C" => 2.00, "C-" => 1.70, "D+" => 1.30, "D" => 1.00, "D-" => 0.70, "F" => 0.00 }
  # end

  # def grade_to_gpa(grade)
  #   grades_hash[grade]
  # end

  # def gpa_to_grade(gpa)
  #   gpa ? grades_hash.invert[gpa.to_f] : nil
  # end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields button", data: {id: id, fields: fields.gsub("\n", "")})
  end

  # def gpa_to_label_class(gpa)
  #   case gpa
  #     when 0..0.7
  #       'inverse'
  #     when 0.7..1.3
  #       'important'
  #     when 1.7..2.7
  #       'warning'
  #     when 2.7..3.7
  #       'info'
  #     else
  #       'success'
  #   end
  # end

  # def grade_to_label_class(grade)
  #   case grade
  #     when "A+", "A", "A-"
  #       'success'
  #     when "B+", "B", "B-"
  #       'info'
  #     when "C+", "C", "C-"
  #       'warning'
  #     when "D+", "D", "D-"
  #       'important'
  #     else
  #       'inverse'
  #   end
  # end
end
