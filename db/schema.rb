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

ActiveRecord::Schema.define(version: 20160927181151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "number"
    t.string   "street_name"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leases", force: :cascade do |t|
    t.integer  "desks"
    t.integer  "month"
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_leases_on_space_id", using: :btree
    t.index ["status_id"], name: "index_leases_on_status_id", using: :btree
    t.index ["user_id"], name: "index_leases_on_user_id", using: :btree
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.integer  "available_desks"
    t.text     "description"
    t.decimal  "price"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["address_id"], name: "index_spaces_on_address_id", using: :btree
    t.index ["user_id"], name: "index_spaces_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "leases", "spaces"
  add_foreign_key "leases", "statuses"
  add_foreign_key "leases", "users"
  add_foreign_key "spaces", "addresses"
  add_foreign_key "spaces", "users"
end
