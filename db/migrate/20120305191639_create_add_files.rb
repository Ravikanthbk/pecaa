class CreateAddFiles < ActiveRecord::Migration
  def change
    create_table :add_files do |t|
      t.integer :user_id
      t.string :upload_file_name
      t.string :upload_content_type
      t.integer :upload_file_size
      t.boolean :is_deleted, :default => false
      t.timestamps
    end
  end
end
