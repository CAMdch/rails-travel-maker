class AddCoordinatesToTransports < ActiveRecord::Migration[6.1]
  def change
    add_column :transports, :latitude_depart, :float
    add_column :transports, :longitude_depart, :float
  end
end
