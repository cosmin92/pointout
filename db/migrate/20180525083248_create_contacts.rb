class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :agency, foreign_key: true
      t.references :address_book, foreign_key: true

      t.timestamps
    end
  end
end
