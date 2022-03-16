# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_16_141228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "type"
    t.float "price"
    t.string "name"
    t.integer "duration"
    t.string "address"
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_activities_on_travel_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_bookings_on_travel_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_favorites_on_travel_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.float "price_per_night"
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_hotels_on_travel_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "type"
    t.string "address_departure"
    t.string "address_arrival"
    t.integer "duration"
    t.float "price"
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_transports_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "travels"
  add_foreign_key "bookings", "travels"
  add_foreign_key "bookings", "users"
  add_foreign_key "favorites", "travels"
  add_foreign_key "favorites", "users"
  add_foreign_key "hotels", "travels"
  add_foreign_key "transports", "travels"
end
