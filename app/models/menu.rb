class Menu < ApplicationRecord
  has_many :menus_products
  has_many :products, through: :menus_products

  validates :name, presence: true, uniqueness: true

  def self.create_menu
    name = "Menu on  #{Time.now.strftime('%A (%m/%d/%y)')}"
    time = Time.now
    create(name: name, start_time: time)
  end

  def product?(product)
    products.exists?(product.id)
  end
end
