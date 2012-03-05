class CreateSubPermissions < ActiveRecord::Migration
  def change
    create_table :sub_permissions do |t|
      t.string :name
      t.string :display_name
      t.integer :permission_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
