FactoryBot.define do
  factory :user do
    name 'MyName'
    email 'myemail@myemail.com'
    password 'MyPassword'

    trait :modify do
      email 'modify@myemail.com'
    end
    trait :invalid do
      email nil
    end
  end
end
