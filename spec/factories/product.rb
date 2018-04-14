FactoryBot.define do
  factory :product do
    user
    name 'MyProduct'
    number '1'
    state 'request'

    trait :modify do
      name 'ModifyProduct'
    end
    trait :invalid do
      name nil
    end
  end
end
