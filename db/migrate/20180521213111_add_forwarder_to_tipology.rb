class AddForwarderToTipology < ActiveRecord::Migration[5.1]
  def change
    add_reference :tipologies, :forwarder, foreign_key: true
  end
end
