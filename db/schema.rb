# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091204172405) do

  create_table "taggings", :force => true do |t|
    t.integer "tag_id"
    t.string  "taggable_type", :default => ""
    t.integer "taggable_id"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name",        :default => ""
    t.string  "kind",        :default => ""
    t.integer "users_count", :default => 0
  end

  add_index "tags", ["name", "kind", "users_count"], :name => "index_tags_on_name_and_kind_and_users_count"

  create_table "users", :force => true do |t|
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "name"
    t.string   "twitter_uid"
    t.string   "avatar_url"
    t.string   "nickname"
    t.text     "purpose"
    t.boolean  "twitter_status",      :default => false
  end

  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token"

end
