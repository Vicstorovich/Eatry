class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def set_category(product)
    self.category_id = product.category.id
  end
end
