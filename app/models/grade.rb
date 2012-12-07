class Grade
  def self.letter_grade_hash
    { "A+" => 4.30, "A" => 4.00, "A-" => 3.70, "B+" => 3.30, "B" => 3.00, "B-" => 2.70, "C+" => 2.30, "C" => 2.00, "C-" => 1.70, "D+" => 1.30, "D" => 1.00, "D-" => 0.70, "F" => 0.00 }
  end

  def self.decimal_places
    2
  end

  def initialize(gpa_or_letter_grade)
    gpa_or_letter_grade = gpa_from_letter_grade(gpa_or_letter_grade) if gpa_or_letter_grade.is_a? String
    @grade = gpa_or_letter_grade
  end

  def to_letter
    @grade ? letter_from_gradepoint(@grade) : nil
  end

  def to_gradepoint
    @grade ? @grade.round(self.class.decimal_places) : nil
  end

  def to_label
    @grade ? label_from_letter_grade(self.to_letter) : nil
  end

  def present?
    @grade ? true : false
  end
  
  private

  def gpa_from_letter_grade(letter_grade)
    self.class.letter_grade_hash[letter_grade]
  end

  def letter_from_gradepoint(gradepoint)
    case gradepoint
      when 0.0
        'F'
      when 0.01..0.7
        'D-'
      when 0.7..1.0
        'D'
      when 1.0..1.3
        'D+'
      when 1.3..1.7
        'C-'
      when 1.7..2.0
        'C'
      when 2.0..2.3
        'C+'
      when 2.3..2.7
        'B-'
      when 2.7..3.0
        'B'
      when 3.0..3.3
        'B+'
      when 3.3..3.7
        'A-'
      when 3.7..4.0
        'A'
      when 4.0..4.3
        'A+'
    end
  end

  def label_from_letter_grade(gradepoint)
    case gradepoint
      when "A+", "A", "A-"
        'success'
      when "B+", "B", "B-"
        'info'
      when "C+", "C", "C-"
        'warning'
      when "D+", "D", "D-"
        'important'
      when "F"
        'inverse'
    end
  end
end
