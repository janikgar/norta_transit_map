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

ActiveRecord::Schema.define(version: 2018_08_01_153217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "service_id"
    t.boolean "sunday"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "onestop_id"
    t.string "name"
    t.string "vehicle_type"
    t.string "color"
    t.text "geometry"
    t.string "wheelchair_accessible"
    t.string "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_or_updated_in_changeset_id"
    t.text "stops_served_by_route"
    t.string "operated_by_onestop_id"
    t.string "operated_by_name"
    t.text "route_stop_patterns_by_onestop_id"
    t.text "tags"
  end

  create_table "schedule_stops", force: :cascade do |t|
    t.string "feed_onestop_id"
    t.string "route_onestop_id"
    t.string "route_stop_pattern_onestop_id"
    t.string "operator_onestop_id"
    t.string "origin_onestop_id"
    t.string "origin_timezone"
    t.time "origin_arrival_time"
    t.time "origin_departure_time"
    t.string "origin_timepoint_source"
    t.float "origin_dist_traveled"
    t.string "destination_onestop_id"
    t.string "destination_timezone"
    t.time "destination_arrival_time"
    t.time "destination_departure_time"
    t.string "destination_timepoint_source"
    t.time "window_start"
    t.time "window_end"
    t.string "trip"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.string "block_id"
    t.date "service_start_date"
    t.date "service_end_date"
    t.text "service_days_of_week"
    t.text "service_added_dates"
    t.text "service_except_dates"
    t.boolean "wheelchair_accessible"
    t.boolean "bikes_allowed"
    t.string "drop_off_type"
    t.string "string"
    t.string "pickup_type"
    t.string "frequency_type"
    t.integer "frequency_headway_seconds"
    t.time "frequency_start_time"
    t.time "frequency_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "feed_version_sha1"
    t.float "shape_dist_traveled"
    t.float "destination_dist_traveled"
  end

  create_table "stop_times", force: :cascade do |t|
    t.integer "trip_id"
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "stop_id"
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
    t.integer "stop_id"
    t.string "stop_code"
    t.string "stop_name"
    t.text "stop_desc"
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
  end

  create_table "trips", force: :cascade do |t|
    t.integer "route_id"
    t.integer "service_id"
    t.integer "trip_id"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.integer "block_id"
    t.integer "shape_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

end
