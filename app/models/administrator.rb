class Administrator < User
  def is_admin?
    true
  end

  def to_s
    super + " (admin)"
  end
end