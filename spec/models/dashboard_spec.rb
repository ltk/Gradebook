require 'spec_helper'

describe Dashboard do
  describe "#initialize" do
    it "should set an instance variable for a student's data when initialized from a Student " do
      semester = FactoryGirl.create(:semester)
      student = FactoryGirl.create(:non_admin)

      dashboard = Dashboard.new(student, semester)
      dashboard.data.should eq(student.course_history(semester))
    end

    it "should set an instance variable for a teachers's data when initialized from a Teacher " do
      semester = FactoryGirl.create(:semester)
      teacher = FactoryGirl.create(:teacher)

      dashboard = Dashboard.new(teacher, semester)
      dashboard.data.should eq(teacher.course_history(semester))
    end
  end
end
