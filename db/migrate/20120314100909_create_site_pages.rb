class CreateSitePages < ActiveRecord::Migration
  def self.up
    create_table :site_pages do |t|
      t.integer :site_id
      t.string :name
      t.string :title
      t.boolean :is_active, :default => true
      t.boolean :is_home_page, :default => false
      t.text :more_info
      t.integer :created_by
      t.integer :parent_id
      t.integer :list_order
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :site_pages
  end
end
