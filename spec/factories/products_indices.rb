FactoryBot.define do
  factory :products_index do
    name 'MyFood'

    trait :modify do
    name 'ModifyFood'
    end
    trait :invalid do
      name nil
    end
  end
end
