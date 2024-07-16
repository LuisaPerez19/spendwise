FactoryBot.define do
  factory :expense do
    title { "Cinema" }
    amount { 0 }
    user
    date {DateTime.now}
    category

    # initialize_with do
    #   new(attributes.merge(category: build(:category)))
    # end

  end
end
