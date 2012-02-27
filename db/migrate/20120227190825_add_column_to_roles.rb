class AddColumnToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :display_name, :string
  end
end
