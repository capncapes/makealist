class AddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :store1_price, :float
    add_column :products, :store2_price, :float
  end
end
