# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_17_151411) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "coffee_id"
  end

  create_table "coffees", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.integer "year"
    t.integer "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coffee_id"
    t.integer "rating"
    t.text "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "company"
    t.string "title"
  end

  add_foreign_key "reviews", "coffees"
  add_foreign_key "reviews", "users"
end
