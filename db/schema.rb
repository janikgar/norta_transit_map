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

ActiveRecord::Schema.define(version: 2018_08_01_235417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", primary_key: "agency_id", id: :serial, force: :cascade do |t|
    t.string "agency_name"
    t.string "agency_url"
    t.string "agency_timezone"
    t.string "agency_lang"
    t.string "agency_phone"
    t.string "agency_fare_url"
    t.string "agency_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", primary_key: "service_id", id: :serial, force: :cascade do |t|
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

  create_table "routes", primary_key: "route_id", id: :serial, force: :cascade do |t|
    t.string "route_short_name"
    t.string "route_long_name"
    t.text "route_desc"
    t.integer "route_type"
    t.string "route_url"
    t.string "route_color"
    t.string "route_text_color"
    t.integer "route_sort_order"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_routes_on_agency_id"
  end

  create_table "shape_trips", force: :cascade do |t|
    t.integer "shape_shape_id"
    t.string "trip_trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shapes", force: :cascade do |t|
    t.integer "shape_id"
    t.float "shape_pt_lat"
    t.float "shape_pt_lon"
    t.integer "shape_pt_sequence"
    t.float "shape_dist_traveled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shape_trips_id"
    t.index ["shape_trips_id"], name: "index_shapes_on_shape_trips_id"
  end

  create_table "stop_times", id: :serial, force: :cascade do |t|
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "stop_sequence"
    t.string "stop_headsign"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.float "shape_dist_traveled"
    t.integer "timepoint"
    t.bigint "trip_id"
    t.bigint "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_stop_times_on_stop_id"
    t.index ["trip_id"], name: "index_stop_times_on_trip_id"
  end

  create_table "stops", primary_key: "stop_id", id: :serial, force: :cascade do |t|
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

  create_table "trips", primary_key: "trip_id", id: :serial, force: :cascade do |t|
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.string "block_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.string "shape_id"
    t.string "route_id"
    t.string "service_id"
    t.bigint "shape_trips_id"
    t.bigint "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_trips_on_calendar_id"
    t.index ["shape_trips_id"], name: "index_trips_on_shape_trips_id"
  end

end
