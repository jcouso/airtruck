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

ActiveRecord::Schema.define(version: 20170811140001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_orders_on_trip_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.string   "departure_address"
    t.string   "arrival_address"
    t.integer  "vacancies"
    t.integer  "price"
    t.integer  "truck_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "city_origin_id"
    t.integer  "city_destination_id"
    t.index ["city_destination_id"], name: "index_trips_on_city_destination_id", using: :btree
    t.index ["city_origin_id"], name: "index_trips_on_city_origin_id", using: :btree
    t.index ["truck_id"], name: "index_trips_on_truck_id", using: :btree
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.integer  "vacancies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_trucks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "category"
    t.string   "phone"
    t.string   "address"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "orders", "trips"
  add_foreign_key "orders", "users"
  add_foreign_key "trips", "cities", column: "city_destination_id"
  add_foreign_key "trips", "cities", column: "city_origin_id"
  add_foreign_key "trips", "trucks"
  add_foreign_key "trucks", "users"
end
