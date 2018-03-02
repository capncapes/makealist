class CreateBasics < ActiveRecord::Migration[5.1]
  def change
    create_table :basics do |t|
      t.string :name
      t.string :description
      t.integer :position
      t.boolean :todo

      t.timestamps
    end
  end
end
