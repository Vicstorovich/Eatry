FactoryBot.define do
  factory :order do
    name { "MyString" }
    address { "MyText" }
    email { Faker::Internet.email }

    trait :invalid do
       address { nil }
    end
  end
end
