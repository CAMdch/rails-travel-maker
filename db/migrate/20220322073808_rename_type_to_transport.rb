class RenameTypeToTransport < ActiveRecord::Migration[6.1]
  def change
    rename_column :transports, :type, :means_of
  end
end
