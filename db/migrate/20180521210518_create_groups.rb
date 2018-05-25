class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :logo, null: false
      t.integer :parent_id

      t.timestamps
    end
    add_index :groups, :name
  end
end
