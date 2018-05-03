FactoryBot.define do
  factory :product do
    user
    name '0'
    number '1'
    state 'request'
    note Faker::Pokemon.name
    price Faker::Number.between(1.10000)
    due_date Faker::Date.forward(30)

    trait :modify do
      name '1'
    end
    trait :invalid do
      name nil
    end
  end
end
