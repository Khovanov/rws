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

ActiveRecord::Schema.define(version: 20160523082916) do

  create_table "carriages", force: :cascade do |t|
    t.integer  "number",            limit: 4
    t.string   "type",              limit: 255
    t.integer  "top_seats",         limit: 4
    t.integer  "bottom_seats",      limit: 4
    t.integer  "train_id",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "side_top_seats",    limit: 4
    t.integer  "side_bottom_seats", limit: 4
  end

  add_index "carriages", ["train_id"], name: "index_carriages_on_train_id", using: :btree

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id", limit: 4
    t.integer  "route_id",           limit: 4
    t.integer  "order",              limit: 4
    t.datetime "arrival_time"
    t.datetime "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "train_id",         limit: 4
    t.integer  "start_station_id", limit: 4
    t.integer  "end_station_id",   limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "full_name",        limit: 255
    t.string   "passport",         limit: 255
  end

  add_index "tickets", ["end_station_id"], name: "index_tickets_on_end_station_id", using: :btree
  add_index "tickets", ["start_station_id"], name: "index_tickets_on_start_station_id", using: :btree
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.string   "number",                    limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "current_station_id",        limit: 4
    t.integer  "route_id",                  limit: 4
    t.boolean  "ascending_carriages_order",             default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
