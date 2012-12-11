require 'spec_helper'

describe "Student Login" do
  it "Directs a student to his/her dashboard after login" do
    student = FactoryGirl.create(:user)

    semester1 = FactoryGirl.create(:semester, :name => "Fall 2012", :start_date => Date.yesterday, :end_date => Date.tomorrow)
    semester2 = FactoryGirl.create(:semester, :name => "Spring 2012")

    course1 = FactoryGirl.create(:course, :semester => semester1, :name => "Intro Bio")
    course2 = FactoryGirl.create(:course, :semester => semester1, :name => "Intro Chem")
    course3 = FactoryGirl.create(:course, :semester => semester2)
    course4 = FactoryGirl.create(:course, :semester => semester2)

    enrollment1 = Enrollment.create({ :user_id => student.id, :course_id => course1.id, :grade => 4.0 })
    enrollment2 = Enrollment.create({ :user_id => student.id, :course_id => course2.id, :grade => 3.0 })
    enrollment3 = Enrollment.create({ :user_id => student.id, :course_id => course3.id, :grade => 2.0 })
    enrollment4 = Enrollment.create({ :user_id => student.id, :course_id => course4.id, :grade => 1.0 })

    visit root_path
    click_link "Login"
    fill_in "Email", :with => student.email
    fill_in "Password", :with => student.password
    click_button "Login"
    current_path.should eq(dashboard_path)
    page.should have_content("Welcome")
    page.should have_content("Your Current Courses")
    page.should have_content("Overall GPA: 2.5")
    page.should have_content("Intro Bio | A")
    page.should have_content("Intro Chem | B")
    page.should have_content("Semester GPA: 3.5")
  end
end
describe "Teacher Login" do
  it "Directs a student to his/her dashboard after login" do
    teacher = FactoryGirl.create(:teacher)

    semester1 = FactoryGirl.create(:semester, :name => "Fall 2012")
    semester2 = FactoryGirl.create(:semester)

    course1 = FactoryGirl.create(:course, :semester => semester1, :name => "Intro Bio")
    course2 = FactoryGirl.create(:course, :semester => semester1)
    course3 = FactoryGirl.create(:course, :semester => semester2, :name => "Intro Chem")
    course4 = FactoryGirl.create(:course, :semester => semester2)

    teaching_assignment1 = TeachingAssignment.create({ :teacher_id => teacher.id, :course_id => course1.id })
    teaching_assignment2 = TeachingAssignment.create({ :teacher_id => teacher.id, :course_id => course2.id })
    teaching_assignment3 = TeachingAssignment.create({ :teacher_id => teacher.id, :course_id => course3.id })
    teaching_assignment4 = TeachingAssignment.create({ :teacher_id => teacher.id, :course_id => course4.id })

    visit root_path
    click_link "Login"
    fill_in "Email", :with => teacher.email
    fill_in "Password", :with => teacher.password
    click_button "Login"
    current_path.should eq(dashboard_path)
    page.should have_content("Welcome")
    page.should have_content("Your Current Courses")
    page.should have_content("Fall 2012")
    page.should have_content("Intro Bio")
    page.should have_content("Intro Chem")
  end
end