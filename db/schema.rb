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

ActiveRecord::Schema.define(version: 2018_12_12_153128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocs", force: :cascade do |t|
    t.string "fr_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_cards", force: :cascade do |t|
    t.bigint "ref_card_id"
    t.boolean "reved"
    t.integer "condition"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ph_one"
    t.string "ph_two"
    t.string "ph_three"
    t.string "ph_four"
    t.string "ph_five"
    t.index ["ref_card_id"], name: "index_collection_cards_on_ref_card_id"
  end

  create_table "energy_types", force: :cascade do |t|
    t.string "fr_name"
    t.string "us_name"
    t.string "symbol_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "fr_name"
    t.string "us_name"
    t.string "fr_release_date"
    t.string "us_release_date"
    t.string "size"
    t.string "fr_logo_url"
    t.string "us_logo_url"
    t.string "symbol_url"
    t.bigint "bloc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bloc_id"], name: "index_lists_on_bloc_id"
  end

  create_table "ref_cards", force: :cascade do |t|
    t.string "number"
    t.string "rarety_type"
    t.string "ultra_type"
    t.string "fr_name"
    t.string "us_name"
    t.string "super_type"
    t.bigint "energy_type_id"
    t.integer "pokedex_number"
    t.string "artist"
    t.string "fr_url"
    t.string "fr_r_url"
    t.string "us_url"
    t.string "us_r_url"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["energy_type_id"], name: "index_ref_cards_on_energy_type_id"
    t.index ["list_id"], name: "index_ref_cards_on_list_id"
  end

  create_table "search_cards", force: :cascade do |t|
    t.bigint "ref_card_id"
    t.boolean "reved"
    t.integer "condition"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ref_card_id"], name: "index_search_cards_on_ref_card_id"
  end

  create_table "shop_cards", force: :cascade do |t|
    t.bigint "ref_card_id"
    t.boolean "reved"
    t.integer "condition"
    t.string "language"
    t.float "price"
    t.string "ph_one"
    t.string "ph_two"
    t.string "ph_three"
    t.string "ph_four"
    t.string "ph_five"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ref_card_id"], name: "index_shop_cards_on_ref_card_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collection_cards", "ref_cards"
  add_foreign_key "lists", "blocs"
  add_foreign_key "ref_cards", "energy_types"
  add_foreign_key "ref_cards", "lists"
  add_foreign_key "search_cards", "ref_cards"
  add_foreign_key "shop_cards", "ref_cards"
end
