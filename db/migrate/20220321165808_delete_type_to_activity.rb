class DeleteTypeToActivity < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :type
  end
end
