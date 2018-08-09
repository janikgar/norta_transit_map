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

ActiveRecord::Schema.define(version: 2018_08_09_192527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "onestop_ids", force: :cascade do |t|
    t.string "name"
    t.string "vehicle_type"
    t.string "color"
    t.text "geometry"
    t.string "wheelchair_accessible"
    t.string "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_stop_patterns", force: :cascade do |t|
    t.string "onestop_id"
    t.string "route_onestop_id"
    t.text "geometry"
    t.text "stop_pattern"
    t.text "stop_distances"
    t.text "identifiers"
    t.text "trips"
    t.text "tags"
    t.string "geometry_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "route"
    t.string "headsign"
    t.string "origin_stop"
    t.time "origin_stop_time"
    t.datetime "remote_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "onestop_id"
    t.text "geometry"
    t.string "name"
    t.string "timezone"
    t.integer "osm_way_id"
    t.datetime "last_conflated_at"
    t.text "served_by_vehicle_types"
    t.boolean "wheelchair_boarding"
    t.text "geometry_reversegeo"
    t.text "geometry_centroid"
    t.text "operators_serving_stop"
    t.text "routes_serving_stop"
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
