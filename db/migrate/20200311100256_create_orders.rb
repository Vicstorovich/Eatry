class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
