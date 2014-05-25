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

ActiveRecord::Schema.define(version: 20140525000936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: true do |t|
    t.integer  "school_id"
    t.integer  "coach_id"
    t.datetime "attendance_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coaches", force: true do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "schools", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coach_id"
    t.string   "name"
  end

  create_table "student_attendances", force: true do |t|
    t.integer  "attendance_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "did_attend"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.boolean  "paid"
    t.integer  "tshirt"
    t.boolean  "dropped"
    t.integer  "soccerballs"
  end

  create_table "users", force: true do |t|
    t.text     "email_address"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
