FactoryBot.define do
  factory :product do
    user
    name 'MyProduct'
    number '1'
    state 'request'
    note Faker::Pokemon.name
    price Faker::Number.between(1.10000)
    due_date Faker::Date.forward(30)

    trait :modify do
      name 'ModifyProduct'
    end
    trait :invalid do
      name nil
    end
  end
end
