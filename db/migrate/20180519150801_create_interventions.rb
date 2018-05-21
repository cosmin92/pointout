class CreateInterventions < ActiveRecord::Migration[5.1]
  def change
    create_table :interventions do |t|
      t.string :intervention_type
      t.references :signaler, foreign_key: true
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
