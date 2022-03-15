class CreateTransports < ActiveRecord::Migration[6.1]
  def change
    create_table :transports do |t|
      t.string :type
      t.string :address_departure
      t.string :address_arrival
      t.integer :duration
      t.float :price
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
