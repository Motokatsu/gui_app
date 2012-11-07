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

ActiveRecord::Schema.define(:version => 20121107150629) do

  create_table "gui_dialogs", :force => true do |t|
    t.string   "module"
    t.string   "title_jp"
    t.string   "title_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gui_images", :force => true do |t|
    t.string   "name"
    t.string   "style",      :default => "tina"
    t.integer  "panel_id",   :default => 0
    t.integer  "dialog_id",  :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "gui_logics", :force => true do |t|
    t.string   "module"
    t.string   "name"
    t.string   "symbol"
    t.integer  "lid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gui_panels", :force => true do |t|
    t.string   "module"
    t.string   "name_jp"
    t.string   "name_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gui_view_key_infos", :force => true do |t|
    t.integer  "view_key_id"
    t.integer  "logic_id"
    t.boolean  "update_on_realtime"
    t.boolean  "update_on_activate"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "gui_view_keys", :force => true do |t|
    t.string   "name"
    t.integer  "image_id",   :default => 0
    t.integer  "x"
    t.integer  "y"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "gui_view_keys", ["name"], :name => "index_gui_view_keys_on_name", :unique => true

end
