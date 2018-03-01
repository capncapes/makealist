class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :store1_name
      t.text :store1_link
      t.string :store2_name
      t.text :store2_link

      t.timestamps
    end
  end
end
