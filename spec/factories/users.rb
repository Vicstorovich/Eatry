FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  sequence :name do |n|
    "name_#{n}"
  end

  factory :user do
    name
    email
    password { "12345678" }
    password_confirmation { "12345678" }

    trait :invalid do
       password_confirmation { nil }
    end
  end
end
