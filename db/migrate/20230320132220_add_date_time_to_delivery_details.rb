class AddDateTimeToDeliveryDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :design_details, :datetime_of_occasion, :datetime, null: false

  end
end
