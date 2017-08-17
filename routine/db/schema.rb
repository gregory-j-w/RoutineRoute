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

ActiveRecord::Schema.define(version: 20170816235142) do

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.string "rt"
    t.string "rtnm"
    t.string "rtdir"
    t.string "stpid"
    t.string "stpnm"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buses_on_user_id"
  end

  create_table "lstations", force: :cascade do |t|
    t.string "rt"
    t.string "stpId"
    t.string "staNm"
    t.string "rtDesc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ltrains", force: :cascade do |t|
    t.string "rt"
    t.string "destNm"
    t.string "stpId"
    t.string "staNm"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ltrains_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

end
