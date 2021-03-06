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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130515224903) do

  create_table "characters", :force => true do |t|
    t.string   "name",       :limit => 25
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "password_hints", :force => true do |t|
    t.string   "hint",       :limit => 75
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user",         :limit => 25
    t.string   "password",     :limit => 64
    t.string   "hint",         :limit => 25
    t.integer  "character_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
