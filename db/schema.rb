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

ActiveRecord::Schema.define(version: 2019_08_29_093229) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "ruby"
    t.integer "phone_number"
    t.string "email"
    t.integer "age"
    t.string "blood"
    t.string "gender"
    t.integer "payment"
    t.string "contact"
    t.string "confirm_email1"
    t.string "confirm_email2"
  end

  create_table "infos", force: :cascade do |t|
    t.string "name"
    t.string "ruby"
    t.integer "phone_number"
    t.string "email"
    t.integer "age"
    t.string "blood"
    t.string "gender"
    t.integer "payment"
    t.string "contact"
    t.string "confirm_email1"
    t.string "confirm_email2"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "ruby"
    t.string "email"
    t.string "confirm_email1"
    t.string "confirm_email2"
    t.string "contact"
  end

end
