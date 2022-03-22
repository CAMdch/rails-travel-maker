class AddCoordinates2ToTransports < ActiveRecord::Migration[6.1]
  def change
    add_column :transports, :latitude_arrival, :float
    add_column :transports, :longitude_arrival, :float
  end
end
