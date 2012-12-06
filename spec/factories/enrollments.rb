# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enrollment do
    student_id 1
    course_id 1
    grade 1
    semester_id 1
  end
end
