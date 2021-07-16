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

ActiveRecord::Schema.define(version: 2021_07_15_162115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blocs", force: :cascade do |t|
    t.string "fr_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "jap"
    t.string "en_name"
    t.integer "rank"
    t.string "cl_name"
  end

  create_table "cards", force: :cascade do |t|
    t.string "version"
    t.boolean "grading"
    t.float "rating"
    t.bigint "ref_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ref_card_id"], name: "index_cards_on_ref_card_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "type"
    t.string "condition"
    t.string "language"
    t.float "value"
    t.bigint "user_id"
    t.string "itemable_type"
    t.bigint "itemable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ph_one"
    t.string "ph_two"
    t.string "ph_three"
    t.string "ph_four"
    t.string "ph_five"
    t.index ["itemable_type", "itemable_id"], name: "index_items_on_itemable_type_and_itemable_id"
    t.index ["type"], name: "index_items_on_type"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "fr_name"
    t.string "en_name"
    t.string "size"
    t.bigint "bloc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.boolean "promo"
    t.string "jap_name"
    t.integer "rank"
    t.datetime "fr_release"
    t.datetime "us_release"
    t.datetime "jap_release"
    t.index ["bloc_id"], name: "index_lists_on_bloc_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "content"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_photos_on_item_id"
  end

  create_table "read_marks", id: :serial, force: :cascade do |t|
    t.string "readable_type", null: false
    t.integer "readable_id"
    t.string "reader_type", null: false
    t.integer "reader_id"
    t.datetime "timestamp"
    t.index ["readable_type", "readable_id"], name: "index_read_marks_on_readable_type_and_readable_id"
    t.index ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", unique: true
    t.index ["reader_type", "reader_id"], name: "index_read_marks_on_reader_type_and_reader_id"
  end

  create_table "ref_cards", force: :cascade do |t|
    t.string "number"
    t.string "rarety_type"
    t.string "ultra_type"
    t.string "fr_name"
    t.string "en_name"
    t.string "super_type"
    t.integer "pokedex_number"
    t.string "artist"
    t.string "fr_url"
    t.string "fr_r_url"
    t.string "us_url"
    t.string "us_r_url"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
    t.string "jap_name"
    t.string "energy"
    t.index ["list_id"], name: "index_ref_cards_on_list_id"
  end

  create_table "selected_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_selected_items_on_item_id"
    t.index ["user_id"], name: "index_selected_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.integer "postal_code"
    t.string "avatar"
    t.boolean "shipment"
    t.boolean "hand_delivery"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "ref_cards"
  add_foreign_key "items", "users"
  add_foreign_key "lists", "blocs"
  add_foreign_key "photos", "items"
  add_foreign_key "ref_cards", "lists"
  add_foreign_key "selected_items", "items"
  add_foreign_key "selected_items", "users"
end
