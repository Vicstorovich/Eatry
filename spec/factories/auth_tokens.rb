FactoryBot.define do
  factory :auth_token  do
    token { Faker::PhoneNumberAU.phone_number }
  end
end
