class CreateDesignDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :design_details do |t|
      t.text :design_description, null: false
      t.boolean :delivery_required, null: false, default: true
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
