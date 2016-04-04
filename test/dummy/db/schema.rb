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

ActiveRecord::Schema.define(version: 20160328122915) do

  create_table "aa", force: :cascade do |t|
    t.integer  "bb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "abc", force: :cascade do |t|
    t.integer  "abc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apple", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "clients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.integer  "timber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "humor", force: :cascade do |t|
    t.integer  "tile"
    t.integer  "file"
    t.integer  "jile"
    t.integer  "hile"
    t.integer  "kile"
    t.integer  "lile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iop", force: :cascade do |t|
    t.integer  "ii"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ojash", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qqq", force: :cascade do |t|
    t.integer  "aa"
    t.integer  "bbb"
    t.integer  "ccc"
    t.integer  "ddd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "richandai", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rr", force: :cascade do |t|
    t.integer  "rr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timer", force: :cascade do |t|
    t.text     "tt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tt", force: :cascade do |t|
    t.integer  "ff"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yty", force: :cascade do |t|
    t.integer  "yuu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
