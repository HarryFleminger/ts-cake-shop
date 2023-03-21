class CreateFlavours < ActiveRecord::Migration[7.0]
  def change
    create_table :flavours do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
