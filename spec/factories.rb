FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password {"123456"}
    password_confirmation {"123456"}
  end
end
