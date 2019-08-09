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

ActiveRecord::Schema.define(version: 2019_08_09_003804) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "photo_id"
  end

  create_table "pats", force: :cascade do |t|
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "photo_categories", force: :cascade do |t|
    t.integer "photo_id"
    t.integer "category_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "description"
    t.integer "user_id"
    t.integer "album_id"
    t.string "image"
    t.integer "profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "last_login"
    t.datetime "member_since"
    t.integer "age"
    t.string "location"
    t.string "email"
    t.string "avatar"
  end

end
