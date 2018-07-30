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

ActiveRecord::Schema.define(version: 2018_07_30_022803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
