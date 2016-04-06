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

ActiveRecord::Schema.define(version: 20160406111222) do

  create_table "apple", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apricot", force: :cascade do |t|
    t.integer  "name"
    t.string   "fame"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "april6", force: :cascade do |t|
    t.integer  "abb"
    t.datetime "bbb"
    t.text     "ccc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "april61", force: :cascade do |t|
    t.integer  "ee"
    t.integer  "ff"
    t.integer  "ggg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "titlename"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banana", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bharat", force: :cascade do |t|
    t.integer  "dfad"
    t.integer  "adf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "china", force: :cascade do |t|
    t.integer  "sa"
    t.integer  "aaa"
    t.integer  "ff"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "hajmola", force: :cascade do |t|
    t.integer  "name"
    t.text     "address"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "human", force: :cascade do |t|
    t.integer  "fsd"
    t.integer  "dfad"
    t.integer  "dfasd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nepal", force: :cascade do |t|
    t.integer  "name"
    t.string   "fame"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orange", force: :cascade do |t|
    t.integer  "tyoe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shreeram", force: :cascade do |t|
    t.integer  "name"
    t.string   "fame"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
