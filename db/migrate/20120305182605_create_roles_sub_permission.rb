class CreateRolesSubPermission < ActiveRecord::Migration
  def change
    create_table :roles_sub_permissions, :id => false do |t|
      t.integer :role_id
      t.integer :sub_permission_id
    end
  end
end

