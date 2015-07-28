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

ActiveRecord::Schema.define(version: 20150728071212) do

  create_table "boards", force: :cascade do |t|
    t.string   "b_category"
    t.text     "b_content"
    t.string   "b_pwd"
    t.integer  "b_click_count"
    t.integer  "b_like"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "b_picture"
  end

  create_table "replies", force: :cascade do |t|
    t.string   "r_pwd"
    t.text     "r_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "u_pwd"
    t.string   "u_pwd_confirmation"
    t.boolean  "u_admin"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "u_id"
    t.string   "password_digest"
  end

end
