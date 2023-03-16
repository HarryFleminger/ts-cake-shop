class AddDateTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :datetime, :datetime, null: true
  end
end
