class AddPriceToCustomCakes < ActiveRecord::Migration[7.0]
  def change
    add_monetize :custom_cakes, :price, currency: { present: false }
  end
end
