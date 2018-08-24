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

ActiveRecord::Schema.define(version: 2018_08_20_180755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aggr_shapes", force: :cascade do |t|
    t.string "aggr_shape_id"
    t.text "shape_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aggr_shape_id"], name: "index_aggr_shapes_on_aggr_shape_id", unique: true
  end

  create_table "calendars", force: :cascade do |t|
    t.string "service_id"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_calendars_on_service_id", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_id"
    t.string "agency_id"
    t.string "route_short_name"
    t.string "route_long_name"
    t.text "route_desc"
    t.integer "route_type"
    t.string "route_url"
    t.string "route_color"
    t.string "route_text_color"
    t.integer "route_sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_routes_on_route_id", unique: true
  end

  create_table "shapes", force: :cascade do |t|
    t.float "shape_pt_lat"
    t.float "shape_pt_lon"
    t.string "shape_id"
    t.integer "shape_pt_sequence"
    t.float "shape_dist_traveled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.string "trip_id"
    t.string "stop_id"
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "stop_sequence"
    t.string "stop_headsign"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.float "shape_dist_traveled"
    t.integer "timepoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "stop_id"
    t.string "stop_code"
    t.string "stop_name"
    t.string "stop_desc"
    t.float "stop_lat"
    t.float "stop_lon"
    t.string "zone_id"
    t.string "stop_url"
    t.integer "location_type"
    t.string "parent_station"
    t.string "stop_timezone"
    t.integer "wheelchair_boarding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_stops_on_stop_id", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.string "route_id"
    t.string "service_id"
    t.string "shape_id"
    t.string "trip_id"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.string "block_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_trips_on_trip_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "stop_times", "stops", primary_key: "stop_id"
  add_foreign_key "stop_times", "trips", primary_key: "trip_id"
  add_foreign_key "trips", "aggr_shapes", column: "shape_id", primary_key: "aggr_shape_id"
  add_foreign_key "trips", "calendars", column: "service_id", primary_key: "service_id"
  add_foreign_key "trips", "routes", primary_key: "route_id"
end
