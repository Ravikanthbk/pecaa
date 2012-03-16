class AddPasswordValidColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_password_change, :datetime
  end
end
