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

ActiveRecord::Schema.define(version: 2023_09_02_035656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "device_servers", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_device_servers_on_restaurant_id"
  end

  create_table "main_servers", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_main_servers_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.string "server_name"
    t.integer "server_status", default: 0
    t.datetime "server_update"
    t.bigint "device_server_id"
    t.string "restaurant_name"
    t.integer "restaurant_status", default: 0
    t.datetime "restaurant_update"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_server_id"], name: "index_servers_on_device_server_id"
    t.index ["restaurant_id"], name: "index_servers_on_restaurant_id"
  end

  add_foreign_key "device_servers", "restaurants"
  add_foreign_key "main_servers", "restaurants"
  add_foreign_key "servers", "device_servers"
  add_foreign_key "servers", "restaurants"
end
