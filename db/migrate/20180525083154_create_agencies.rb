class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email, null: false
      t.string :fax
      t.string :street, null: false
      t.string :number, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.text :note
      t.string :web_site_url

      t.references :forwarder, foreign_key: true

      t.timestamps
    end
  end
end
