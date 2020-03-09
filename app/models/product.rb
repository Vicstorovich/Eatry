class Product < ApplicationRecord
  scope :menu_products, ->(menu) { joins(:menus).where(menus: { id: menu.id }) }

  belongs_to :category
  has_many :menus_products
  has_many :menus, through: :menus_products
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true

  mount_uploader :image, ProductImageUploader

  private

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    false
  end
end
