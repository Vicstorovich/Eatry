class CreateMenusAndProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, unique: true, null: false
      t.datetime :start_time, null: false
      t.timestamps
    end

    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.string :image
      t.decimal :price, precision: 8, scale: 2
      t.belongs_to :category, foreign_key: true
      t.timestamps
    end

    create_table :menus_products, id: false do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :product, index: true
    end
    add_index :menus_products, [:menu_id, :product_id], unique: true
  end
end
