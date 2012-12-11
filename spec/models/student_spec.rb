require 'spec_helper'

describe Student do
  describe "Respond to" do
    it { should respond_to(:course_history) }
    it { should respond_to(:gpas_from_semesters) }
    it { should respond_to(:gpa) }
  end

  describe "#course_history" do
    it "should return hash of course data" do
      student = FactoryGirl.create(:non_admin)
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      enrollment = Enrollment.create({ :user_id => student.id, :course_id => course.id, :grade => 4.0 })
      data = student.course_history(semester)
      data[:semesters].should eq([semester])
      data[:course_memberships][:current][semester].should eq([enrollment])
      data[:gpas][semester].should eq(student.gpa(semester))
      data[:gpas][:overall].should eq(student.gpa)
    end
  end

  describe "#gpas_from_semesters" do
    it "should return a hash of gpas indexed by semester" do
      student = FactoryGirl.create(:non_admin)
      semester1 = FactoryGirl.create(:semester, :name => "Semester 1")
      semester2 = FactoryGirl.create(:semester, :name => "Semester 2")

      course1 = FactoryGirl.create(:course, :semester => semester1)
      course2 = FactoryGirl.create(:course, :semester => semester2)

      enrollment1 = Enrollment.create({ :user_id => student.id, :course_id => course1.id, :grade => 4.0 })
      enrollment2 = Enrollment.create({ :user_id => student.id, :course_id => course2.id, :grade => 2.0 })

      data = student.gpas_from_semesters([semester1, semester2])
      data[semester1].should eq(4.0)
      data[semester2].should eq(2.0)
    end
  end

  describe "#gpa" do
    it "should return the student's overall gpa when not passed a semester" do
      student = FactoryGirl.create(:non_admin)
      semester1 = FactoryGirl.create(:semester, :name => "Semester 1")
      semester2 = FactoryGirl.create(:semester, :name => "Semester 2")

      course1 = FactoryGirl.create(:course, :semester => semester1)
      course2 = FactoryGirl.create(:course, :semester => semester1)
      course3 = FactoryGirl.create(:course, :semester => semester2)
      course4 = FactoryGirl.create(:course, :semester => semester2)

      enrollment1 = Enrollment.create({ :user_id => student.id, :course_id => course1.id, :grade => 4.0 })
      enrollment2 = Enrollment.create({ :user_id => student.id, :course_id => course2.id, :grade => 3.0 })
      enrollment3 = Enrollment.create({ :user_id => student.id, :course_id => course3.id, :grade => 2.0 })
      enrollment4 = Enrollment.create({ :user_id => student.id, :course_id => course4.id, :grade => 1.0 })

      student.gpa.should eq(2.5)
    end

    it "should return the student's semester gpa when passed a semester" do
      student = FactoryGirl.create(:non_admin)
      semester1 = FactoryGirl.create(:semester, :name => "Semester 1")
      semester2 = FactoryGirl.create(:semester, :name => "Semester 2")

      course1 = FactoryGirl.create(:course, :semester => semester1)
      course2 = FactoryGirl.create(:course, :semester => semester1)
      course3 = FactoryGirl.create(:course, :semester => semester2)
      course4 = FactoryGirl.create(:course, :semester => semester2)

      enrollment1 = Enrollment.create({ :user_id => student.id, :course_id => course1.id, :grade => 4.0 })
      enrollment2 = Enrollment.create({ :user_id => student.id, :course_id => course2.id, :grade => 3.0 })
      enrollment3 = Enrollment.create({ :user_id => student.id, :course_id => course3.id, :grade => 2.0 })
      enrollment4 = Enrollment.create({ :user_id => student.id, :course_id => course4.id, :grade => 1.0 })

      student.gpa(semester1).should eq(3.5)
      student.gpa(semester2).should eq(1.5)
    end
  end
end
