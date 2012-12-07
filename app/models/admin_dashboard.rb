class AdminDashboard
  attr_reader :data

  def initialize(current_semester)
    @data = { :courses => { current_semester => Course.for_semester(current_semester).order('name ASC') } }
  end
  
end
