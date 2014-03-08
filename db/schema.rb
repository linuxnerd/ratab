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

ActiveRecord::Schema.define(version: 20140308142449) do

  create_table "branches", force: true do |t|
    t.string   "branch_number"
    t.string   "branch_name"
    t.string   "branch_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_applies", force: true do |t|
    t.string   "provider"
    t.date     "provider_date"
    t.string   "brand"
    t.string   "model"
    t.string   "operators"
    t.string   "procurement_method"
    t.integer  "device_num"
    t.string   "imei"
    t.integer  "sim_num"
    t.string   "sim_sn"
    t.string   "apply_reason"
    t.integer  "branch_id"
    t.string   "contacts"
    t.string   "contact_phone"
    t.string   "remarks"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "device_applies", ["user_id"], name: "index_device_applies_on_user_id"

  create_table "device_fee_configs", force: true do |t|
    t.string   "settlement_date"
    t.string   "unicom_device_price"
    t.string   "unicom_data_price"
    t.string   "telecom_device_price"
    t.string   "telecom_data_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replacements", force: true do |t|
    t.date     "replacement_date"
    t.string   "reason"
    t.integer  "device_num"
    t.string   "imei"
    t.integer  "sim_num"
    t.string   "sim_sn"
    t.integer  "device_apply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replacements", ["device_apply_id"], name: "index_replacements_on_device_apply_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",                   default: "user"
    t.string   "phone"
    t.string   "last_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_expires_after"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
