class AddTypeToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :type, :integer
  end
end
