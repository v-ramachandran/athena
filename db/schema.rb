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

ActiveRecord::Schema.define(version: 20141128080737) do

  create_table "recommendation_validations", force: true do |t|
    t.integer  "restaurant_recommendation_id"
    t.integer  "time_to_complete"
    t.datetime "time_of_entry"
    t.boolean  "valid_recommendation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hit_id"
    t.string   "assignment_id"
    t.string   "worker_id"
  end

  add_index "recommendation_validations", ["restaurant_recommendation_id"], name: "validating_recommendation_id"

  create_table "restaurant_recommendations", force: true do |t|
    t.text     "name"
    t.integer  "time_to_complete"
    t.datetime "time_of_entry"
    t.text     "serialized_terms"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "hit_id"
    t.string   "worker_id"
    t.string   "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
