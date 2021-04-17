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

ActiveRecord::Schema.define(version: 2021_04_16_090714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.decimal "quantity_in_kg", precision: 13, scale: 3
    t.bigint "user_id", null: false
    t.bigint "truck_route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["truck_route_id"], name: "index_bookings_on_truck_route_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["origin_id"], name: "index_routes_on_origin_id"
  end

  create_table "truck_routes", force: :cascade do |t|
    t.bigint "truck_id", null: false
    t.bigint "route_id", null: false
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_truck_routes_on_route_id"
    t.index ["truck_id"], name: "index_truck_routes_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "name"
    t.string "plate_no"
    t.decimal "capacity_in_kg", precision: 13, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "image"
    t.text "bio"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bookings", "truck_routes"
  add_foreign_key "bookings", "users"
  add_foreign_key "routes", "locations", column: "destination_id"
  add_foreign_key "routes", "locations", column: "origin_id"
  add_foreign_key "truck_routes", "routes"
  add_foreign_key "truck_routes", "trucks"
end
