class CreateSiteLinks < ActiveRecord::Migration
  def change
    create_table :site_links do |t|
      t.text :description
      t.string :name
      t.integer :created_by
      t.boolean :is_active
      t.string :title
      t.text :target
      t.integer :site_id
      t.string :type

      t.timestamps
    end
  end
end
