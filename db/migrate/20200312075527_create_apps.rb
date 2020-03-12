class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string :email, unique: true, null:false
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
