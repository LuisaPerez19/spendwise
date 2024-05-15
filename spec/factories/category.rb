FactoryBot.define do
  factory :category do
    name { "Test Category" }
    amount { 0 }
    user
  end
end
