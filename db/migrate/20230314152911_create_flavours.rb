class CreateFlavours < ActiveRecord::Migration[7.0]
  def change
    create_table :flavours do |t|
      t.string :flavour, null: false
      t.timestamps
    end
  end
end
