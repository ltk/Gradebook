# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    first_name "Foo"
    last_name "Bar"
    email "foo@example.com"
    password "correct horse battery staple"
    password_confirmation "correct horse battery staple"
  end

  factory :admin, :class => User do
    first_name "Foo"
    last_name "Bar"
    email "admin@example.com"
    password "correct horse battery staple"
    password_confirmation "correct horse battery staple"
    admin true
  end

  factory :non_admin, :class => User do
    first_name "Foo"
    last_name "Bar"
    email "nonadmin@example.com"
    password "correct horse battery staple"
    password_confirmation "correct horse battery staple"
    admin false
  end
end
