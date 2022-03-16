class AddDateToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :date_departure, :date
    add_column :hotels, :date_arrival, :date
  end
end
