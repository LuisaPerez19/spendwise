FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password {"Password123!"}
    password_confirmation {"Password123!"}
  end
end
