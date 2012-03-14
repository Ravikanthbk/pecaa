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

ActiveRecord::Schema.define(:version => 20120313174023) do

  create_table "add_files", :force => true do |t|
    t.integer  "user_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.boolean  "is_deleted",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "nickname"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "address_type"
  end

  create_table "content_libraries", :force => true do |t|
    t.string   "name"
    t.integer  "source_id"
    t.string   "source_type"
    t.string   "last_used"
    t.integer  "times_used"
    t.string   "added_by"
    t.boolean  "is_deleted",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.boolean  "is_deleted",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.integer  "created_by"
  end

  create_table "roles_sub_permissions", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "sub_permission_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "site_links", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.integer  "created_by"
    t.boolean  "is_active"
    t.string   "title"
    t.text     "target"
    t.integer  "site_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.integer  "created_by"
    t.boolean  "is_active",   :default => true
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["created_by"], :name => "index_sites_on_created_by"

  create_table "sub_permissions", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "permission_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", :force => true do |t|
    t.integer  "user_id"
    t.string   "text_block_name"
    t.text     "description"
    t.boolean  "is_deleted",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "company"
    t.string   "title"
    t.string   "login_page"
    t.string   "user_identity"
    t.text     "notes"
    t.boolean  "active"
    t.datetime "last_login"
    t.string   "role_title"
    t.string   "launch_link"
    t.integer  "created_by"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "source_content_type"
    t.string   "source_file_name"
    t.integer  "source_file_size"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "is_deleted",          :default => false
  end

end
