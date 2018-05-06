class CreateTipologies < ActiveRecord::Migration[5.1]
  def change
    create_table :tipologies do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.integer :parent_id

      t.timestamps
    end
  end
end
