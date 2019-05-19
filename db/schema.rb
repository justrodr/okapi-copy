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

ActiveRecord::Schema.define(version: 20190413190229) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "orders", force: :cascade do |t|
    t.string   "shipping_address"
    t.string   "tenant_name"
    t.string   "tenant_email"
    t.integer  "size10b20"
    t.integer  "size14b20"
    t.integer  "size16b24"
    t.integer  "size18b30"
    t.integer  "size12b12"
    t.integer  "size14b24"
    t.integer  "size16b25"
    t.integer  "size20b20"
    t.integer  "size12b20"
    t.integer  "size14b25"
    t.integer  "size18b18"
    t.integer  "size20b24"
    t.integer  "size12b24"
    t.integer  "size14b30"
    t.integer  "size18b20"
    t.integer  "size20b25"
    t.integer  "size12b30"
    t.integer  "size15b20"
    t.integer  "size18b24"
    t.integer  "size20b30"
    t.integer  "size12b36"
    t.integer  "size16b20"
    t.integer  "size18b25"
    t.integer  "size24b24"
    t.integer  "size25b25"
    t.integer  "property"
    t.string   "order_status"
    t.integer  "user"
    t.float    "amount_paid"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "filter_freq"
    t.float    "price"
    t.string   "start_date"
    t.string   "delivered_date"
    t.string   "sent_date"
    t.boolean  "canceled",         default: false
    t.integer  "sub_freq"
    t.string   "next_ship_date"
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user"
    t.string   "prop_name"
    t.string   "tenant_name"
    t.string   "tenant_email"
    t.string   "tenant_phone"
    t.string   "address"
    t.integer  "frequency"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "last_delivered"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
