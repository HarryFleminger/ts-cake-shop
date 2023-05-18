class AddStockCountAndInStockBooleonToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stock_count, :integer, default: 0
    add_column :products, :in_stock, :boolean, default: false
  end
end
