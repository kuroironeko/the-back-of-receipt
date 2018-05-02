FactoryBot.define do
  factory :products_index do
    sequence(:name) {Faker::Food.dish}

    trait :modify do
    sequence(:name) {Faker::Food.dish}
    end
    trait :invalid do
      name nil
    end
  end
end
