FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    description { Faker::Commerce.product_name }

    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/my_file.jpg'))) }

    association :category, factory: :category
  end
end
