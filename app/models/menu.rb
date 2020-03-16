class Menu < ApplicationRecord
  has_many :menus_products
  has_many :products, through: :menus_products

  validates :name, presence: true, uniqueness: true

  def self.create_menu
    current_menu = Menu.find_by(name: "Menu on  #{Date.today.inspect}")
    if !current_menu
      name = "Menu on  #{Date.today.inspect}"
      time = Date.today
      create(name: name, start_time: time)
    else
      false
    end
  end

  def product?(product)
    products.exists?(product.id)
  end

  def category?(category)
    products.exists?(category)
  end
end
