require 'spec_helper'

describe Course do
  describe "Associations" do
    it { should have_many(:enrollments) }
    it { should have_many(:teaching_assignments) }
    it { should have_many(:students) }
    it { should have_many(:teachers) }
    it { should belong_to(:semester) }
  end

  describe "Mass assignment" do
    it { should_not allow_mass_assignment_of(:type) }
  end

  describe "Validations" do
    it { should validate_presence_of(:semester) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:description) }
  end

  describe "Respond to" do
    it { should respond_to(:enrollment) }
    it { should respond_to(:for_semester) }
    it { should respond_to(:average_gradepoint) }
  end

  describe "#enrollment" do
    it "should return the first enrollment" do
      student = FactoryGirl.create(:non_admin)
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      enrollment = Enrollment.create(:user_id => student.id, :course_id => course.id )
      course.enrollment.should be(course.enrollments.first)
    end
  end

  describe "#for_semester" do
    it "should return true if it belongs to the passed semester" do
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      course.for_semester(semester).should be_true
    end

    it "should return false if it does not belong to the passed semester" do
      semester1 = FactoryGirl.create(:semester, :name => "Semester 1")
      semester2 = FactoryGirl.create(:semester, :name => "Semester 2")
      course = FactoryGirl.create(:course, :semester => semester1)
      course.for_semester(semester2).should be_false
    end
  end

  describe "#average_gradepoint" do
    it "should the average grade of all enrolled students" do
      student1 = FactoryGirl.create(:non_admin)
      student2 = FactoryGirl.create(:non_admin, :email => 'student2@gradebook.com')
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      enrollment1 = Enrollment.create(:user_id => student1.id, :course_id => course.id, :grade => 3.0 )
      enrollment2 = Enrollment.create(:user_id => student2.id, :course_id => course.id, :grade => 4.0 )
      course.average_gradepoint.should eq(3.5)
    end
  end
end
