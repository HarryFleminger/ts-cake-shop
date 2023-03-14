class CreateDeliveryAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :postcode, null: false
      t.string :phone_number, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
