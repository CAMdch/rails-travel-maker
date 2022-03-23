class AdddateToTravels < ActiveRecord::Migration[6.1]
  def change
    add_column :travels, :start_date, :date
    add_column :travels, :end_date, :date
  end
end
