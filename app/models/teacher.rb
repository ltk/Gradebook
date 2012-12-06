class Teacher < User

  def to_s
    super + " (teacher)"
  end
end