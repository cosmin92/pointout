# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180505175339) do

  create_table "signalers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "profile_picture"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "zip_code"
    t.string "id_card_number"
    t.string "municipality"
    t.date "release_date"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_signalers_on_email", unique: true
    t.index ["id_card_number"], name: "index_signalers_on_id_card_number", unique: true
    t.index ["phone"], name: "index_signalers_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_signalers_on_reset_password_token", unique: true
  end

  create_table "tipologies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
