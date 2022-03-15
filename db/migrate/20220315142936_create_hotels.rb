class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :address
      t.string :name
      t.float :price_per_night
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
