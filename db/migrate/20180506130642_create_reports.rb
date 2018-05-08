class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :object, null: false
      t.text :description, null: false
      t.string :images
      t.string :address, null: false
      t.decimal :longitude, :precision => 10, :scale => 6, null: false
      t.decimal :latitude, :precision => 10, :scale => 6, null: false
      t.string :report_type, :default => "Segnalation", null: false
      t.string :intervention_type, :default => "Ordinary", null: false
      t.string :state, :default => "Pending", null: false

      t.references :signaler, foreign_key: true
      t.references :tipology, foreign_key: true

      t.timestamps
    end

    add_index :reports, :object
    add_index :reports, :address
    add_index :reports, [:longitude, :latitude]
  end
end
