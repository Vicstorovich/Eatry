class MenusProducts < ApplicationRecord
  belongs_to :menus
  belongs_to :products
end
