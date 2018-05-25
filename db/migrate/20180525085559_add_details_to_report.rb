class AddDetailsToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :forwarder, :integer
    add_column :reports, :agency, :integer
  end
end
