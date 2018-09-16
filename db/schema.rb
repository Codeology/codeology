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

ActiveRecord::Schema.define(version: 20180916021227) do

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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest"
    t.boolean  "is_admin",               default: false
    t.integer  "curr_week",              default: 0
    t.integer  "next_week",              default: 0
    t.integer  "interviewing_curr_week", default: 0
    t.integer  "interviewing_next_week", default: 0
    t.integer  "interviewing_limit",     default: 2
    t.string   "activation_digest"
    t.boolean  "activated",              default: false
    t.datetime "activated_at"
    t.datetime "activation_sent_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "slot_table", "users"
end
