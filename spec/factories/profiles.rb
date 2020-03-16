FactoryBot.define do
  factory :profile do
    address { 'Address' }

    trait :invalid do
       address { nil }
    end

    association :user, factory: :user
  end
end
