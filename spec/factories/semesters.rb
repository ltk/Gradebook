# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :semester do
    courses_count 1
    start_date "2012-12-01"
    end_date "2012-12-10"
    name "MyString"
  end
end
