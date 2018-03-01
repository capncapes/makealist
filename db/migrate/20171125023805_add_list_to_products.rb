class AddListToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :list_id, :integer
    add_index :products, :list_id
  end
end
