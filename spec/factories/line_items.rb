FactoryBot.define do
  factory :line_item do
    product_id { nil }
    cart_id { nil }
    order_id { nil }
    quantity { 1 }
    category_id {0}

    association :cart, factory: :cart
    association :product, factory: :product
  end
end
