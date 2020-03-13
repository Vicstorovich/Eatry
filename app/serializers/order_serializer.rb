class OrderSerializer < ActiveModel::Serializer
  attributes :number_order, :product_name, :order_price, :name, :address, :email, :product_name

  def number_order
    object.itself.id
  end

  def product_name
    object.itself.name_product
  end

  def order_price
    object.itself.total_price
  end
end
