class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :posting_date, null: false
      t.date :expiration_date, null: false
      t.string :notice_type, null: false

      t.references :group, foreign_key: true
      t.references :forwarder, foreign_key: true

      t.timestamps
    end
  end
end
