class AddListToBasics < ActiveRecord::Migration[5.1]
  def change
  	add_column :basics, :list_id, :integer
    add_index :basics, :list_id
  end
end
