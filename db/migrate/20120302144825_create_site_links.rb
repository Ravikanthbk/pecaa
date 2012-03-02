class CreateSiteLinks < ActiveRecord::Migration
  def change
    create_table :site_links do |t|
      t.text        :description
      t.integer     :created_by
      t.boolean     :is_active, :default => true
      t.string      :title
      t.text        :target
      t.integer     :site_id
      t.text        :name
      t.string      :type

      t.timestamps
    end
    
    add_index :site_links, :site_id
    add_index :site_links, :created_by
    
  end
end
