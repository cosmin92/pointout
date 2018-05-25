class CreateOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :occupations do |t|
      t.references :group, foreign_key: true
      t.references :tipology, foreign_key: true

      t.timestamps
    end
  end
end
