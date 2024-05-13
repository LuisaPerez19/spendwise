FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password {"12345678"}
    password_confirmation {"12345678"}
  end
end
