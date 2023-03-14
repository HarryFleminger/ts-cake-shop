class CreateCustomCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_cakes do |t|
      t.monetize :amount, current: { present: false }
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
