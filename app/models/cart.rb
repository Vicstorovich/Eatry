class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product, menu)
    current_item = line_items.find_by(category_id: product.category_id)
    if current_item
      errors[:base] << "The product is already added to the menu!!!"
      current_item = nil
    else
      current_item = line_items.build(product_id: product.id, menu_id: menu.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
