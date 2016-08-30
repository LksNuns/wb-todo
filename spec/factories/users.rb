FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password "password123"
    name "name"
  end
end
