class AddDateToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :date, :date
  end
end
