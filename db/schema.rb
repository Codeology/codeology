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

ActiveRecord::Schema.define(version: 20180103195104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "past_interviews", force: :cascade do |t|
    t.integer "technical_score"
    t.integer "communnication_score"
    t.integer "problem_solving_score"
    t.string  "feedback"
    t.integer "slot"
    t.integer "date"
    t.integer "interviewee"
    t.integer "interviewer"
  end

  create_table "slot_table", force: :cascade do |t|
    t.integer "slot"
    t.integer "user_id"
    t.index ["user_id"], name: "index_slot_table_on_user_id", using: :btree
  end

  create_table "upcoming_interviews", force: :cascade do |t|
    t.integer "slot"
    t.integer "interviewee"
    t.integer "interviewer"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.string   "title"
    t.text     "bio"
    t.boolean  "is_officer",      default: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.integer  "curr_week",       default: 0
    t.integer  "next_week",       default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "slot_table", "users"
end
