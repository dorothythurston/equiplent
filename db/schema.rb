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

ActiveRecord::Schema.define(version: 20140512175701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "category",   null: false
  end

  create_table "member_profiles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "production"
    t.string   "role"
  end

  create_table "pairs", force: true do |t|
    t.integer  "item_id",      null: false
    t.integer  "pair_item_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "user_id",                                null: false
    t.integer  "item_id",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reservation_status", default: "current", null: false
    t.datetime "begins_at",                              null: false
    t.datetime "ends_at",                                null: false
  end

  create_table "users", force: true do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",                                          null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.integer  "profile_id"
    t.string   "profile_type"
    t.string   "first_name",                                     null: false
    t.string   "last_name",                                      null: false
    t.string   "telephone",                                      null: false
    t.boolean  "admin",                          default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
