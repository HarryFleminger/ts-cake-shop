class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :flavour, null: false, foreign_key: true
      t.references :custom_cake, null: false, foreign_key: true
      t.references :delivery_address, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false, default: "pending"
      t.string :paid_status, null: false, default: "unpaid"
      t.boolean :delivery_required, null: false, default: true
      t.text :design_description, null: true
      t.timestamps
    end
  end
end
