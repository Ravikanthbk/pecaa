class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :user_id
      t.string :text_block_name
      t.text :description
      t.boolean :is_deleted, :default => false
      t.timestamps
    end
  end
end
