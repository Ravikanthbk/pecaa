class AddExtraColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "last_login", :datetime
    add_column "users", "role_title", :string
  end

  def self.down
    remove_column "users", "last_login"
    remove_column "users", "role_title"
  end
end