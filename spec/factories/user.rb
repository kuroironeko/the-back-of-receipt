FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { Faker::Internet.password }

    trait :modify do
      sequence(:email) { Faker::Internet.email }
    end
    trait :invalid do
      email nil
    end
    after(:create) do |user|
      3.times { create(:product, user: user) }
    end
  end
end
