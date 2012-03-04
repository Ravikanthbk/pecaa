class AddCreatedByColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "created_by", :integer
    add_column "roles", "created_by", :integer
  end

  def self.down
    remove_column "users", "created_by"
    remove_column "roles", "created_by"
  end
end
