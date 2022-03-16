class AddDateToTransport < ActiveRecord::Migration[6.1]
  def change
    add_column :transports, :date, :date
  end
end
