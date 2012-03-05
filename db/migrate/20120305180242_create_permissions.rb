class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :display_name
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
