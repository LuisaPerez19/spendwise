FactoryBot.define do
  # factory :category do
  #   name { "Test Category" }
  #   amount { 0 }
  #   user_id { 2 }
  # end


  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password {"Password123!"}
    password_confirmation {"Password123!"}
  end
end
