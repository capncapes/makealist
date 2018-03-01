class RemoveOrderFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :order, :integer
  end
end
