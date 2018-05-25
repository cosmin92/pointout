class CreateAddressBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :address_books do |t|
      t.string :name, null: false
      t.text :note
      t.references :group, foreign_key: true
      t.references :forwarder, foreign_key: true

      t.timestamps
    end
  end
end
