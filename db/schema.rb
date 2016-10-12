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

ActiveRecord::Schema.define(version: 20161010213359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.integer  "space_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "location_picture_file_name"
    t.string   "location_picture_content_type"
    t.integer  "location_picture_file_size"
    t.datetime "location_picture_updated_at"
    t.index ["space_id"], name: "index_images_on_space_id", using: :btree
  end

  create_table "leases", force: :cascade do |t|
    t.integer  "desks"
    t.integer  "month"
    t.integer  "user_id"
    t.integer  "status_id",   default: 0
    t.integer  "space_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "description"
    t.index ["space_id"], name: "index_leases_on_space_id", using: :btree
    t.index ["status_id"], name: "index_leases_on_status_id", using: :btree
    t.index ["user_id"], name: "index_leases_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "user1_visited_timestamp", default: '2016-10-12 20:35:48'
    t.datetime "user2_visited_timestamp", default: '2016-10-12 20:35:48'
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.integer  "available_desks"
    t.text     "description"
    t.decimal  "price",           precision: 30, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "number"
    t.string   "street_name"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_spaces_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "online",                 default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "images", "spaces"
  add_foreign_key "leases", "spaces"
  add_foreign_key "leases", "statuses"
  add_foreign_key "leases", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "spaces", "users"
end
