# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_24_194521) do

  create_table "categories", force: :cascade do |t|
    t.string "ilk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.text "note"
    t.integer "user_id", null: false
    t.integer "trick_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trick_id"], name: "index_tips_on_trick_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "tricks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tricks_on_category_id"
    t.index ["name"], name: "index_tricks_on_name"
    t.index ["user_id"], name: "index_tricks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "tips", "tricks"
  add_foreign_key "tips", "users"
  add_foreign_key "tricks", "categories"
  add_foreign_key "tricks", "users"
end
