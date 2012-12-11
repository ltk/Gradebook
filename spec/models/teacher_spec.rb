require 'spec_helper'

describe Teacher do
  describe "Respond to" do
    it { should respond_to(:course_history) }
  end

  describe "#course_history" do
    it "should return hash of course data" do
      teacher = FactoryGirl.create(:teacher)
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      teaching_assignment = TeachingAssignment.create({ :teacher_id => teacher.id, :course_id => course.id })

      data = teacher.course_history(semester)
      data[:semesters].should eq([semester])
      data[:course_memberships][:current][semester].should eq([teaching_assignment])
    end
  end
end
