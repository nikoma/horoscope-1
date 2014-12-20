# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141220163350) do

  create_table "forecasts", force: true do |t|
    t.integer  "id_zd"
    t.string   "dt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
  end

  add_index "forecasts", ["dt"], name: "index_forecasts_on_dt"
  add_index "forecasts", ["id_zd"], name: "index_forecasts_on_id_zd"

  create_table "users", force: true do |t|
    t.integer  "id_zd"
    t.string   "email"
    t.string   "dt_of_b"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "zodiacs", force: true do |t|
    t.integer  "id_zd"
    t.string   "name"
    t.string   "begin_dt"
    t.string   "end_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zodiacs", ["id_zd"], name: "index_zodiacs_on_id_zd"
  add_index "zodiacs", ["name"], name: "index_zodiacs_on_name"

end
