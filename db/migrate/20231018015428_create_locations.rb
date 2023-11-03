class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone
      t.references :owner_user, null: false, foreign_key: { to_table: :users }
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
