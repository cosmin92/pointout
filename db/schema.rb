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

ActiveRecord::Schema.define(version: 20180525085559) do

  create_table "address_books", force: :cascade do |t|
    t.string "name", null: false
    t.text "note"
    t.integer "group_id"
    t.integer "forwarder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forwarder_id"], name: "index_address_books_on_forwarder_id"
    t.index ["group_id"], name: "index_address_books_on_group_id"
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email", null: false
    t.string "fax"
    t.string "street", null: false
    t.string "number", null: false
    t.string "city", null: false
    t.string "zip_code", null: false
    t.text "note"
    t.string "web_site_url"
    t.integer "forwarder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forwarder_id"], name: "index_agencies_on_forwarder_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "agency_id"
    t.integer "address_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_book_id"], name: "index_contacts_on_address_book_id"
    t.index ["agency_id"], name: "index_contacts_on_agency_id"
  end

  create_table "forwarders", force: :cascade do |t|
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
    t.string "profile_picture"
    t.boolean "boss"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_forwarders_on_email", unique: true
    t.index ["group_id"], name: "index_forwarders_on_group_id"
    t.index ["reset_password_token"], name: "index_forwarders_on_reset_password_token", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "logo", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "interventions", force: :cascade do |t|
    t.string "intervention_type"
    t.integer "signaler_id"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_interventions_on_report_id"
    t.index ["signaler_id"], name: "index_interventions_on_signaler_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.date "posting_date", null: false
    t.date "expiration_date", null: false
    t.string "notice_type", null: false
    t.integer "group_id"
    t.integer "forwarder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forwarder_id"], name: "index_notices_on_forwarder_id"
    t.index ["group_id"], name: "index_notices_on_group_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "content"
    t.integer "signaler_id"
    t.integer "report_id"
    t.string "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_observations_on_report_id"
    t.index ["signaler_id"], name: "index_observations_on_signaler_id"
  end

  create_table "occupations", force: :cascade do |t|
    t.integer "group_id"
    t.integer "tipology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_occupations_on_group_id"
    t.index ["tipology_id"], name: "index_occupations_on_tipology_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "object", null: false
    t.text "description", null: false
    t.string "images"
    t.string "address", null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.string "report_type", default: "Segnalation", null: false
    t.string "intervention_type", default: "Ordinary", null: false
    t.string "state", default: "Pending", null: false
    t.integer "signaler_id"
    t.integer "tipology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "forwarder_id"
    t.integer "agency_id"
    t.date "forward_date"
    t.index ["address"], name: "index_reports_on_address"
    t.index ["longitude", "latitude"], name: "index_reports_on_longitude_and_latitude"
    t.index ["object"], name: "index_reports_on_object"
    t.index ["signaler_id"], name: "index_reports_on_signaler_id"
    t.index ["tipology_id"], name: "index_reports_on_tipology_id"
  end

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

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tipologies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "logo", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "forwarder_id"
    t.index ["forwarder_id"], name: "index_tipologies_on_forwarder_id"
    t.index ["name"], name: "index_tipologies_on_name"
  end

end
