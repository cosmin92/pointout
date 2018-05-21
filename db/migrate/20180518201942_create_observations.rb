class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.text :content
      t.references :signaler, foreign_key: true
      t.references :report, foreign_key: true
      t.string :images

      t.timestamps
    end
  end
end
