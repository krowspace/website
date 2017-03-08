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

ActiveRecord::Schema.define(version: 20170212204309) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "seat_id"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "firstName"
    t.string   "lastName"
    t.string   "company"
    t.string   "streetAddress"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "licenseNumber"
    t.string   "licenseState"
    t.string   "paymentType"
    t.string   "cardName"
    t.string   "cardNumber"
    t.string   "expirationDate"
    t.string   "cvv"
    t.string   "email"
    t.string   "cost"
    t.boolean  "active",         default: false
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "krowspaces", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "seat_number"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "zip"
    t.string   "state"
    t.string   "city"
    t.text     "description"
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "krowspace_id"
    t.integer  "seat_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["krowspace_id"], name: "index_seats_on_krowspace_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
