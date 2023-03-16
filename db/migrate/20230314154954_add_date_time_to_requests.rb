class AddDateTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :datetime_of_occasion, :datetime, null: true
  end
end
