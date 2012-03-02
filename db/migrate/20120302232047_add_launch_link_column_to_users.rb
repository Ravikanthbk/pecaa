class AddLaunchLinkColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "launch_link", :string
  end

  def self.down
    remove_column "users", "launch_link"
  end
end