class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.monetize :amount, current: { present: false }
      t.string :checkout_session_id
      t.timestamps
    end
  end
end
