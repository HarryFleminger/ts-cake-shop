class AddDeliveryAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :delivery_address, null: true, foreign_key: true
  end
end
