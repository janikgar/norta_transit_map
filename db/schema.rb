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

ActiveRecord::Schema.define(version: 2018_08_06_145407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "agency_name"
    t.string "agency_timezone"
    t.string "agency_phone"
    t.string "agency_fare_url"
    t.string "agency_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agency_url"
    t.string "agency_lang"
  end

  create_table "calendars", force: :cascade do |t|
    t.boolean "sunday"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
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
    t.bigint "agency_id"
    t.text "shape_array"
    t.text "stops"
    t.index ["agency_id"], name: "index_routes_on_agency_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.float "shape_pt_lat"
    t.float "shape_pt_lon"
    t.integer "shape_pt_sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shape_id"
    t.float "shape_dist_traveled"
  end

  create_table "stop_times", force: :cascade do |t|
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "stop_sequence"
    t.string "stop_headsign"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.float "shape_dist_traveled"
    t.integer "timepoint"
    t.string "trip_id"
    t.string "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "stop_code"
    t.string "stop_name"
    t.text "stop_desc"
    t.float "stop_lat"
    t.float "stop_lon"
    t.string "zone_id"
    t.string "stop_url"
    t.integer "location_type"
    t.integer "parent_station"
    t.string "stop_timezone"
    t.integer "wheelchair_boarding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.string "block_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.bigint "calendar_id"
    t.string "shape_id"
    t.index ["calendar_id"], name: "index_trips_on_calendar_id"
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  add_foreign_key "routes", "agencies"
  add_foreign_key "trips", "calendars"
  add_foreign_key "trips", "routes"
end
