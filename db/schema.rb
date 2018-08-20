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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_08_20_143742) do
=======
ActiveRecord::Schema.define(version: 2018_08_14_164223) do
>>>>>>> 9469fdea0c1e5f206f67bb1c2d559f2daee8ec3e

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "email_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_email_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_email_users_on_reset_password_token", unique: true
  end

=======
>>>>>>> 9469fdea0c1e5f206f67bb1c2d559f2daee8ec3e
  create_table "routes", force: :cascade do |t|
    t.string "short_name"
    t.string "long_name"
    t.string "onestop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_type"
    t.string "color"
    t.string "text_color"
    t.datetime "remote_updated_at"
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

  create_table "shapes", force: :cascade do |t|
    t.string "shape_pt_lat"
    t.string "shape_pt_lon"
    t.string "shape_id"
    t.string "shape_pt_sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "direction_id"
    t.string "route_id"
    t.string "service_id"
    t.string "shape_id"
    t.string "trip_headsign"
    t.string "trip_id"
    t.string "wheelchair_accessible"
<<<<<<< HEAD
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bikes_allowed"
    t.text "points"
    t.text "days"
    t.text "times"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
=======
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bikes_allowed"
    t.text "points"
    t.text "days"
    t.text "times"
>>>>>>> 9469fdea0c1e5f206f67bb1c2d559f2daee8ec3e
  end

end
