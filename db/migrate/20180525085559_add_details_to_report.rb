class AddDetailsToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :forwarder_id, :integer
    add_column :reports, :agency_id, :integer
    add_column :reports, :forward_date, :date

  end
end
