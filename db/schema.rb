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

ActiveRecord::Schema.define(:version => 10) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "attachments", :force => true do |t|
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories_projects", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "category_id"
  end

  add_index "categories_projects", ["category_id", "project_id"], :name => "index_categories_projects_on_category_id_and_project_id"
  add_index "categories_projects", ["project_id", "category_id"], :name => "index_categories_projects_on_project_id_and_category_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.string   "url"
    t.string   "cover_uid"
    t.string   "cover_name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "account_id"
    t.integer  "order",      :default => 0
  end

  create_table "projects_tags", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "tag_id"
  end

  add_index "projects_tags", ["project_id", "tag_id"], :name => "index_projects_tags_on_project_id_and_tag_id"
  add_index "projects_tags", ["tag_id", "project_id"], :name => "index_projects_tags_on_tag_id_and_project_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
