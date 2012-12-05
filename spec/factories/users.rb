# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    crypted_password "MyString"
    first_name "MyString"
    last_name "MyString"
  end
end
