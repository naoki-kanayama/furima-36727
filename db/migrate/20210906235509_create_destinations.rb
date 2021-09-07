class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_number
      t.string :address_number, null: false
      t.string :tel_number, null: false
      t.references :record, foreign_key: true, null: false

      t.timestamps
    end
  end
end
