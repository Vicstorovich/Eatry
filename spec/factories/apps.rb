FactoryBot.define do
  factory :app do
    email { Faker::Internet.email }
    password { Faker::Number.number(7) }
    token { nil }
  end
end
