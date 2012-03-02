class CreateContentLibraries < ActiveRecord::Migration
  def change
    create_table :content_libraries do |t|
      t.string :name
      t.integer :source_id
      t.string :source_type
      t.string :last_used
      t.integer :times_used
      t.string :added_by
      t.boolean :is_deleted, :default => false
      t.timestamps
    end
  end
end
