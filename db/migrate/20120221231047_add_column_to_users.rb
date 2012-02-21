class AddColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "phone_number", :string
    add_column "users", "company", :string
    add_column "users", "title", :string
    add_column "users", "login_page", :string
    add_column "users", "user_identity", :string
    add_column "addresses", "user_id", :integer
    add_column "addresses", "address_type", :string
    add_column "users", "notes", :text
    add_column "users", "active", :boolean
  end

  def self.down
    remove_column "users", "phone_number"
    remove_column "users", "company"
    remove_column "users", "title"
    remove_column "users", "login_page"
    remove_column "users", "user_identity"
    remove_column "addresses", "user_id"
    remove_column "addresses", "address_type"
    remove_column "users", "notes"
    remove_column "users", "active"
  end
end