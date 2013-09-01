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

ActiveRecord::Schema.define(version: 20130831140639) do

  create_table "availability_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "workday_id"
    t.integer  "available",   default: 2
    t.boolean  "on_wishlist", default: false
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availability_statuses", ["user_id"], name: "index_availability_statuses_on_user_id"
  add_index "availability_statuses", ["workday_id"], name: "index_availability_statuses_on_workday_id"

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.date     "from_date"
    t.date     "to_date"
    t.string   "open_days"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.boolean  "admin"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.date     "started_date",     default: '2013-08-28'
    t.date     "quit_date"
    t.boolean  "active",           default: true
    t.string   "crypted_password"
    t.string   "salt"
  end

  create_table "workdays", force: true do |t|
    t.date     "date"
    t.decimal  "hours"
    t.integer  "person_1_id"
    t.integer  "person_2_id"
    t.integer  "season_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
